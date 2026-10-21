import 'dart:convert';

import '../models/calendar_event.dart';
import '../models/daily_plan.dart';
import '../models/planner_task.dart';
import '../models/reminder_record.dart';
import '../storage/local_store.dart';

enum ReminderPermission { granted, denied, unavailable }

abstract interface class ReminderPlatform {
  Future<ReminderPermission> checkPermission();

  Future<ReminderPermission> requestPermission();

  Future<Set<int>> pendingNotificationIds();

  Future<void> schedule(ReminderRecord reminder);

  Future<void> cancel(int notificationId);
}

class ReminderScheduler {
  ReminderScheduler(this._store, this._platform);

  final LocalStore _store;
  final ReminderPlatform _platform;

  Future<ReminderPermission> get permission => _platform.checkPermission();

  Future<ReminderPermission> requestPermission() async {
    final result = await _platform.requestPermission();
    await reconcile(
      tasks: await _store.readTasks(),
      events: await _store.readCalendarEvents(),
      plan: await _store.readLatestPlan(),
    );
    return result;
  }

  Future<void> reconcile({
    required List<PlannerTask> tasks,
    required List<CalendarEvent> events,
    required DailyPlan? plan,
  }) async {
    final now = DateTime.now();
    final desired = _desiredReminders(tasks, events, plan, now);
    final persisted = await _store.readReminders();
    final byKey = {for (final reminder in persisted) reminder.key: reminder};
    final permission = await _platform.checkPermission();
    final pending = await _platform.pendingNotificationIds();

    // Remove orphaned OS requests even if their database row was lost.
    final knownIds = persisted.map((r) => r.notificationId).toSet();
    final desiredIds = desired.values.map((r) => r.notificationId).toSet();
    for (final id in pending.difference(knownIds).difference(desiredIds)) {
      await _platform.cancel(id);
    }

    for (final reminder in persisted) {
      if (!desired.containsKey(reminder.key)) {
        if (pending.contains(reminder.notificationId)) {
          await _platform.cancel(reminder.notificationId);
        }
        if (reminder.status != ReminderStatus.obsolete) {
          final obsolete = reminder.copyWith(
            status: ReminderStatus.obsolete,
            updatedAt: now,
          );
          await _store.saveReminder(obsolete);
          await _audit(obsolete, 'obsolete',
              'Cancelled because its task/event is complete, removed, elapsed, or no longer has a planned reminder.');
        }
      }
    }

    for (final entry in desired.entries) {
      var reminder = entry.value;
      final previous = byKey[entry.key];
      if (previous != null) {
        // IDs are key-derived and stable across edits/restarts.
        reminder = reminder.copyWith(notificationId: previous.notificationId);
      }
      final changed = previous == null ||
          previous.scheduledFor != reminder.scheduledFor ||
          previous.title != reminder.title ||
          previous.body != reminder.body ||
          previous.evidence != reminder.evidence ||
          !_sameEvidenceIds(previous.evidenceIds, reminder.evidenceIds) ||
          previous.status != ReminderStatus.scheduled;
      final missingFromPlatform = !pending.contains(reminder.notificationId);
      if (permission != ReminderPermission.granted) {
        if (pending.contains(reminder.notificationId)) {
          await _platform.cancel(reminder.notificationId);
        }
        final waiting = reminder.copyWith(
          status: ReminderStatus.waitingPermission,
          updatedAt: now,
        );
        await _store.saveReminder(waiting);
        if (changed || previous.status != ReminderStatus.waitingPermission) {
          await _audit(waiting, 'permission-deferred',
              'Reminder was not scheduled because notification permission is ${permission.name}.');
        }
        continue;
      }
      if (changed || missingFromPlatform) {
        await _platform.schedule(reminder);
        reminder = reminder.copyWith(
          status: ReminderStatus.scheduled,
          updatedAt: now,
        );
        await _store.saveReminder(reminder);
        await _audit(
          reminder,
          previous == null ? 'scheduled' : 'rescheduled',
          previous == null
              ? reminder.evidence
              : 'Reminder time or content changed. ${reminder.evidence}',
        );
      }
    }
  }

  Map<String, ReminderRecord> _desiredReminders(
    List<PlannerTask> tasks,
    List<CalendarEvent> events,
    DailyPlan? plan,
    DateTime now,
  ) {
    final desired = <String, ReminderRecord>{};
    final tasksById = {for (final task in tasks) task.id: task};
    if (plan != null) {
      for (final block in plan.blocks.where((block) =>
          block.type == PlanBlockType.task && block.startsAt.isAfter(now))) {
        final id = block.id.startsWith('task-')
            ? block.id.substring('task-'.length)
            : '';
        final task = tasksById[id];
        if (task == null || task.status != PlannerTaskStatus.pending) continue;
        final scheduleAt = block.startsAt.subtract(const Duration(minutes: 10));
        if (!scheduleAt.isAfter(now)) continue;
        final key = 'task-start:${task.id}';
        desired[key] = _record(
          key: key,
          ownerId: task.id,
          kind: ReminderKind.taskStart,
          at: scheduleAt,
          title: 'Task coming up',
          body:
              '${task.title} is planned to start at ${_clock(block.startsAt)}.',
          evidence:
              'Task is pending and its persisted daily plan starts at ${block.startsAt}; reminder is set 10 minutes earlier.',
          evidenceIds: [
            ...block.evidenceIds,
            'task:${task.id}',
            'plan:${plan.id}'
          ],
          now: now,
        );
      }
    }

    for (final task
        in tasks.where((t) => t.status == PlannerTaskStatus.pending)) {
      final at = task.deadline.subtract(const Duration(minutes: 15));
      if (!at.isAfter(now)) continue;
      final key = 'task-deadline:${task.id}';
      desired[key] = _record(
        key: key,
        ownerId: task.id,
        kind: ReminderKind.taskDeadline,
        at: at,
        title: 'Task deadline approaching',
        body: '${task.title} is due at ${_clock(task.deadline)}.',
        evidence:
            'Task ${task.id} is pending with a persisted deadline at ${task.deadline}; reminder is set 15 minutes earlier.',
        evidenceIds: [
          'task:${task.id}',
          'deadline:${task.deadline.toIso8601String()}'
        ],
        now: now,
      );
    }

    for (final event in events) {
      final at = event.startsAt.subtract(const Duration(minutes: 15));
      if (!at.isAfter(now)) continue;
      final key = 'appointment:${event.id}';
      desired[key] = _record(
        key: key,
        ownerId: event.id,
        kind: ReminderKind.appointment,
        at: at,
        title: 'Upcoming appointment',
        body: '${event.title} starts at ${_clock(event.startsAt)}.',
        evidence:
            'Persisted calendar event ${event.id} starts at ${event.startsAt}; reminder is set 15 minutes earlier.',
        evidenceIds: [
          'event:${event.id}',
          'event-start:${event.startsAt.toIso8601String()}'
        ],
        now: now,
      );
    }
    return desired;
  }

  ReminderRecord _record({
    required String key,
    required String ownerId,
    required ReminderKind kind,
    required DateTime at,
    required String title,
    required String body,
    required String evidence,
    required List<String> evidenceIds,
    required DateTime now,
  }) =>
      ReminderRecord(
        key: key,
        notificationId: _stableNotificationId(key),
        ownerId: ownerId,
        kind: kind,
        scheduledFor: at,
        title: title,
        body: body,
        evidence: evidence,
        evidenceIds: evidenceIds,
        status: ReminderStatus.scheduled,
        updatedAt: now,
      );

  Future<void> _audit(
    ReminderRecord reminder,
    String operation,
    String explanation,
  ) async {
    final now = DateTime.now();
    await _store.saveReminderAudit(ReminderAudit(
      id: 'reminder-audit-${reminder.key}-$operation-${now.microsecondsSinceEpoch}',
      reminderKey: reminder.key,
      operation: operation,
      explanation: explanation,
      createdAt: now,
    ));
  }

  static int _stableNotificationId(String key) {
    var hash = 0x811c9dc5;
    for (final unit in utf8.encode(key)) {
      hash = ((hash ^ unit) * 0x01000193) & 0x7fffffff;
    }
    return hash == 0 ? 1 : hash;
  }

  static String _clock(DateTime time) =>
      '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

  static bool _sameEvidenceIds(List<String> left, List<String> right) {
    if (left.length != right.length) return false;
    for (var index = 0; index < left.length; index++) {
      if (left[index] != right[index]) return false;
    }
    return true;
  }
}
