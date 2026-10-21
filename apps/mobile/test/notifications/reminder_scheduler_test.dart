import 'package:flutter_test/flutter_test.dart';
import 'package:niva_mobile/models/calendar_event.dart';
import 'package:niva_mobile/models/daily_plan.dart';
import 'package:niva_mobile/models/planner_task.dart';
import 'package:niva_mobile/models/reminder_record.dart';
import 'package:niva_mobile/notifications/reminder_scheduler.dart';
import 'package:niva_mobile/storage/in_memory_local_store.dart';

void main() {
  late InMemoryLocalStore store;
  late FakeReminderPlatform platform;
  late ReminderScheduler scheduler;
  late DateTime now;

  setUp(() {
    store = InMemoryLocalStore();
    platform = FakeReminderPlatform();
    scheduler = ReminderScheduler(store, platform);
    now = DateTime.now();
  });

  test('schedules deadline, plan start, and appointment with stable IDs',
      () async {
    final task = _task(now, id: 'study');
    final event = _event(now, id: 'appointment-1');
    final plan = _plan(now, task);

    await scheduler.reconcile(
      tasks: [task],
      events: [event],
      plan: plan,
    );

    expect(
        platform.scheduled.keys,
        containsAll([
          'task-deadline:study',
          'task-start:study',
          'appointment:appointment-1',
        ]));
    expect(platform.scheduled.values.map((r) => r.notificationId).toSet(),
        hasLength(3));
    expect(
        (await store.readReminders()).every((r) =>
            r.status == ReminderStatus.scheduled && r.evidence.isNotEmpty),
        isTrue);
    expect((await store.readReminderAudits()).map((a) => a.operation),
        everyElement('scheduled'));
  });

  test('updates changed reminder time without changing its ID', () async {
    final task = _task(now, id: 'study');
    final schedulerPlan = _plan(now, task);
    await scheduler.reconcile(tasks: [task], events: [], plan: schedulerPlan);
    final before = platform.scheduled['task-deadline:study']!;
    final moved =
        task.copyWith(deadline: task.deadline.add(const Duration(hours: 1)));

    await scheduler.reconcile(
      tasks: [moved],
      events: [],
      plan: _plan(now, moved),
    );

    final after = platform.scheduled['task-deadline:study']!;
    expect(after.notificationId, before.notificationId);
    expect(after.scheduledFor,
        moved.deadline.subtract(const Duration(minutes: 15)));
    expect(
        (await store.readReminderAudits())
            .any((a) => a.operation == 'rescheduled'),
        isTrue);
  });

  test('cancels task and appointment reminders when items become obsolete',
      () async {
    final task = _task(now, id: 'study');
    final event = _event(now, id: 'appointment-1');
    await scheduler.reconcile(
      tasks: [task],
      events: [event],
      plan: _plan(now, task),
    );

    await scheduler.reconcile(
      tasks: [task.copyWith(status: PlannerTaskStatus.completed)],
      events: [],
      plan: null,
    );

    expect(platform.scheduled, isEmpty);
    expect(platform.cancelled, hasLength(3));
    expect(
        (await store.readReminders())
            .every((r) => r.status == ReminderStatus.obsolete),
        isTrue);
  });

  test(
      'reconcile is duplicate-safe and repairs missing Android requests on restart',
      () async {
    final event = _event(now, id: 'appointment-1');
    await scheduler.reconcile(tasks: [], events: [event], plan: null);
    final first = Map<String, ReminderRecord>.from(platform.scheduled);
    await scheduler.reconcile(tasks: [], events: [event], plan: null);
    expect(platform.scheduleCalls, 1);

    platform.scheduled
        .clear(); // simulate OS loss while persisted state survives
    final restartedScheduler = ReminderScheduler(store, platform);
    await restartedScheduler.reconcile(tasks: [], events: [event], plan: null);
    expect(platform.scheduleCalls, 2);
    expect(platform.scheduled['appointment:appointment-1']!.notificationId,
        first['appointment:appointment-1']!.notificationId);
  });

  test('denied permission keeps local planner state and does not schedule',
      () async {
    platform.permission = ReminderPermission.denied;
    final event = _event(now, id: 'appointment-1');

    await scheduler.reconcile(tasks: [], events: [event], plan: null);

    expect(platform.scheduled, isEmpty);
    expect((await store.readReminders()).single.status,
        ReminderStatus.waitingPermission);
    expect((await store.readReminderAudits()).single.operation,
        'permission-deferred');
  });

  test('permission revocation cancels existing requests and defers reminders',
      () async {
    final event = _event(now, id: 'appointment-1');
    await scheduler.reconcile(tasks: [], events: [event], plan: null);
    expect(platform.scheduled, hasLength(1));
    platform.permission = ReminderPermission.denied;

    await scheduler.reconcile(tasks: [], events: [event], plan: null);

    expect(platform.scheduled, isEmpty);
    expect((await store.readReminders()).single.status,
        ReminderStatus.waitingPermission);
  });

  test('does not schedule past or completed reminders', () async {
    final task = _task(now, id: 'done').copyWith(
      status: PlannerTaskStatus.completed,
      deadline: now.add(const Duration(minutes: 5)),
    );
    final pastEvent = CalendarEvent(
      id: 'past',
      title: 'Past',
      startsAt: now.subtract(const Duration(hours: 1)),
      endsAt: now.subtract(const Duration(minutes: 30)),
    );

    await scheduler.reconcile(tasks: [task], events: [pastEvent], plan: null);

    expect(platform.scheduled, isEmpty);
  });
}

PlannerTask _task(DateTime now, {required String id}) => PlannerTask(
      id: id,
      title: 'Study',
      duration: const Duration(minutes: 45),
      deadline: now.add(const Duration(hours: 3)),
      priority: PlannerTaskPriority.normal,
      status: PlannerTaskStatus.pending,
      createdAt: now,
      updatedAt: now,
    );

CalendarEvent _event(DateTime now, {required String id}) => CalendarEvent(
      id: id,
      title: 'Appointment',
      startsAt: now.add(const Duration(hours: 5)),
      endsAt: now.add(const Duration(hours: 6)),
    );

DailyPlan _plan(DateTime now, PlannerTask task) {
  final start = now.add(const Duration(hours: 1));
  return DailyPlan(
    id: 'plan-1',
    date: DateTime(start.year, start.month, start.day),
    blocks: [
      PlanBlock(
        id: 'task-${task.id}',
        type: PlanBlockType.task,
        title: task.title,
        startsAt: start,
        endsAt: start.add(task.duration),
        evidenceIds: ['task:${task.id}'],
      ),
    ],
    evidenceIds: ['task:${task.id}'],
    createdAt: now,
    updatedAt: now,
  );
}

class FakeReminderPlatform implements ReminderPlatform {
  ReminderPermission permission = ReminderPermission.granted;
  final Map<String, ReminderRecord> scheduled = {};
  final List<int> cancelled = [];
  int scheduleCalls = 0;

  @override
  Future<ReminderPermission> checkPermission() async => permission;

  @override
  Future<ReminderPermission> requestPermission() async => permission;

  @override
  Future<Set<int>> pendingNotificationIds() async =>
      scheduled.values.map((reminder) => reminder.notificationId).toSet();

  @override
  Future<void> schedule(ReminderRecord reminder) async {
    scheduleCalls++;
    scheduled[reminder.key] = reminder;
  }

  @override
  Future<void> cancel(int notificationId) async {
    cancelled.add(notificationId);
    scheduled.removeWhere(
        (_, reminder) => reminder.notificationId == notificationId);
  }
}
