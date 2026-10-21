import 'package:drift/drift.dart';

import '../core/time/time_window.dart';
import '../models/alarm.dart' as domain;
import '../models/calendar_event.dart' as domain;
import '../models/daily_plan.dart' as domain;
import '../models/memory.dart' as domain;
import '../models/niva_notification.dart' as domain;
import '../models/route_profile.dart' as domain;
import '../models/planner_task.dart' as domain;
import '../models/reminder_record.dart' as domain;
import '../models/user_profile.dart' as domain;
import '../models/weather.dart' as domain;
import 'app_database.dart';
import 'local_store.dart';

class DriftLocalStore implements LocalStore {
  DriftLocalStore(this.database);

  final AppDatabase database;

  @override
  Future<domain.UserProfile?> readProfile() async {
    final row = await database.select(database.userProfiles).getSingleOrNull();
    return row == null ? null : _profileFromRow(row);
  }

  @override
  Future<void> saveProfile(domain.UserProfile profile) async {
    await database.into(database.userProfiles).insertOnConflictUpdate(
          UserProfilesCompanion.insert(
            id: profile.id,
            displayName: profile.displayName,
            timezone: profile.timezone,
            locale: profile.locale,
            preferredTone: profile.preferredTone.name,
            preferredNotificationLevel: profile.preferredNotificationLevel.name,
            defaultTravelBufferMinutes: profile.defaultTravelBuffer.inMinutes,
            sleepStartHour: profile.typicalSleepWindow.startHour,
            sleepStartMinute: profile.typicalSleepWindow.startMinute,
            sleepEndHour: profile.typicalSleepWindow.endHour,
            sleepEndMinute: profile.typicalSleepWindow.endMinute,
            wakeStartHour: profile.typicalWakeWindow.startHour,
            wakeStartMinute: profile.typicalWakeWindow.startMinute,
            wakeEndHour: profile.typicalWakeWindow.endHour,
            wakeEndMinute: profile.typicalWakeWindow.endMinute,
            createdAt: profile.createdAt,
            updatedAt: profile.updatedAt,
          ),
        );
  }

  @override
  Future<List<domain.Memory>> readMemories() async {
    final rows = await (database.select(database.memories)
          ..orderBy([(table) => OrderingTerm.desc(table.updatedAt)]))
        .get();
    return rows.map(_memoryFromRow).toList();
  }

  @override
  Future<void> saveMemory(domain.Memory memory) async {
    await database.into(database.memories).insertOnConflictUpdate(
          MemoriesCompanion.insert(
            id: memory.id,
            type: memory.type.name,
            title: memory.title,
            value: memory.value,
            source: memory.source.name,
            confidence: memory.confidence.name,
            createdAt: memory.createdAt,
            updatedAt: memory.updatedAt,
            condition: Value(memory.condition),
            expiresAt: Value(memory.expiresAt),
            lastUsedAt: Value(memory.lastUsedAt),
          ),
        );
  }

  @override
  Future<void> deleteMemory(String id) async {
    await (database.delete(database.memories)
          ..where((row) => row.id.equals(id)))
        .go();
  }

  @override
  Future<List<domain.CalendarEvent>> readCalendarEvents() async {
    final rows = await (database.select(database.calendarEvents)
          ..orderBy([(table) => OrderingTerm.asc(table.startsAt)]))
        .get();
    return rows.map(_calendarEventFromRow).toList();
  }

  @override
  Future<void> saveCalendarEvent(domain.CalendarEvent event) async {
    await database.into(database.calendarEvents).insertOnConflictUpdate(
          CalendarEventsCompanion.insert(
            id: event.id,
            title: event.title,
            startsAt: event.startsAt,
            endsAt: event.endsAt,
            locationName: Value(event.locationName),
          ),
        );
  }

  @override
  Future<void> deleteCalendarEvent(String id) async {
    await (database.delete(database.calendarEvents)
          ..where((row) => row.id.equals(id)))
        .go();
  }

  @override
  Future<List<domain.PlannerTask>> readTasks() async {
    final rows = await (database.select(database.plannerTasks)
          ..orderBy([(row) => OrderingTerm.asc(row.deadline)]))
        .get();
    return rows.map(_plannerTaskFromRow).toList();
  }

  @override
  Future<void> saveTask(domain.PlannerTask task) async {
    await database.into(database.plannerTasks).insertOnConflictUpdate(
          PlannerTasksCompanion.insert(
            id: task.id,
            title: task.title,
            durationMinutes: task.duration.inMinutes,
            deadline: task.deadline,
            priority: task.priority.name,
            status: task.status.name,
            createdAt: task.createdAt,
            updatedAt: task.updatedAt,
            earliestStart: Value(task.earliestStart),
            notes: Value(task.notes),
          ),
        );
  }

  @override
  Future<domain.DailyPlan?> readLatestPlan() async {
    final plan = await (database.select(database.plans)
          ..orderBy([(table) => OrderingTerm.desc(table.updatedAt)])
          ..limit(1))
        .getSingleOrNull();
    if (plan == null) {
      return null;
    }

    final blocks = await (database.select(database.planBlocks)
          ..where((row) => row.planId.equals(plan.id))
          ..orderBy([(table) => OrderingTerm.asc(table.startsAt)]))
        .get();

    final planBlocks = blocks.map(_planBlockFromRow).toList();
    final conflicts = planBlocks
        .where((block) => block.type == domain.PlanBlockType.conflict)
        .map((block) => domain.PlanConflict(
              id: block.id,
              summary: block.title.replaceFirst('Schedule conflict: ', ''),
              affectedItemIds: block.evidenceIds
                  .where((id) => id.startsWith('evidence-event-'))
                  .map((id) => id.replaceFirst('evidence-event-', ''))
                  .toList(),
              deadline: block.startsAt,
              evidenceIds: block.evidenceIds,
            ))
        .toList();
    return domain.DailyPlan(
      id: plan.id,
      date: plan.date,
      blocks: planBlocks,
      evidenceIds: _decodeList(plan.evidenceIds),
      createdAt: plan.createdAt,
      updatedAt: plan.updatedAt,
      conflicts: conflicts,
    );
  }

  @override
  Future<void> savePlan(domain.DailyPlan plan) async {
    await database.transaction(() async {
      await database.into(database.plans).insertOnConflictUpdate(
            PlansCompanion.insert(
              id: plan.id,
              date: plan.date,
              evidenceIds: _encodeList(plan.evidenceIds),
              createdAt: plan.createdAt,
              updatedAt: plan.updatedAt,
            ),
          );
      await (database.delete(database.planBlocks)
            ..where((row) => row.planId.equals(plan.id)))
          .go();
      for (final block in plan.blocks) {
        await database.into(database.planBlocks).insert(
              PlanBlocksCompanion.insert(
                id: block.id,
                planId: plan.id,
                type: block.type.name,
                title: block.title,
                startsAt: block.startsAt,
                endsAt: block.endsAt,
                evidenceIds: _encodeList(block.evidenceIds),
              ),
            );
      }
    });
  }

  @override
  Future<List<domain.AdaptiveAlarm>> readAlarms() async {
    final rows = await (database.select(database.alarms)
          ..orderBy([(table) => OrderingTerm.asc(table.scheduledFor)]))
        .get();
    return rows.map(_alarmFromRow).toList();
  }

  @override
  Future<void> saveAlarm(domain.AdaptiveAlarm alarm) async {
    await database.into(database.alarms).insertOnConflictUpdate(
          AlarmsCompanion.insert(
            id: alarm.id,
            scheduledFor: alarm.scheduledFor,
            reason: alarm.reason,
            evidenceIds: _encodeList(alarm.evidenceIds),
            calculationVersion: alarm.calculationVersion,
            isActive: alarm.isActive,
          ),
        );
  }

  @override
  Future<List<domain.ReminderRecord>> readReminders() async {
    final rows = await (database.select(database.reminderRows)
          ..orderBy([(row) => OrderingTerm.asc(row.scheduledFor)]))
        .get();
    return rows
        .map((row) => domain.ReminderRecord(
              key: row.key,
              notificationId: row.notificationId,
              ownerId: row.ownerId,
              kind: _enumByName(domain.ReminderKind.values, row.kind),
              scheduledFor: row.scheduledFor,
              title: row.title,
              body: row.body,
              evidence: row.evidence,
              evidenceIds: _decodeList(row.evidenceIds),
              status: _enumByName(domain.ReminderStatus.values, row.status),
              updatedAt: row.updatedAt,
            ))
        .toList();
  }

  @override
  Future<void> saveReminder(domain.ReminderRecord reminder) async {
    await database.into(database.reminderRows).insertOnConflictUpdate(
          ReminderRowsCompanion.insert(
            key: reminder.key,
            notificationId: reminder.notificationId,
            ownerId: reminder.ownerId,
            kind: reminder.kind.name,
            scheduledFor: reminder.scheduledFor,
            title: reminder.title,
            body: reminder.body,
            evidence: reminder.evidence,
            evidenceIds: _encodeList(reminder.evidenceIds),
            status: reminder.status.name,
            updatedAt: reminder.updatedAt,
          ),
        );
  }

  @override
  Future<List<domain.ReminderAudit>> readReminderAudits() async {
    final rows = await (database.select(database.reminderAuditRows)
          ..orderBy([(row) => OrderingTerm.asc(row.createdAt)]))
        .get();
    return rows
        .map((row) => domain.ReminderAudit(
              id: row.id,
              reminderKey: row.reminderKey,
              operation: row.operation,
              explanation: row.explanation,
              createdAt: row.createdAt,
            ))
        .toList();
  }

  @override
  Future<void> saveReminderAudit(domain.ReminderAudit audit) async {
    await database.into(database.reminderAuditRows).insertOnConflictUpdate(
          ReminderAuditRowsCompanion.insert(
            id: audit.id,
            reminderKey: audit.reminderKey,
            operation: audit.operation,
            explanation: audit.explanation,
            createdAt: audit.createdAt,
          ),
        );
  }

  @override
  Future<List<domain.NivaNotification>> readNotificationHistory() async {
    final rows = await (database.select(database.notificationRows)
          ..orderBy([(table) => OrderingTerm.desc(table.createdAt)]))
        .get();
    return rows.map(_notificationFromRow).toList();
  }

  @override
  Future<void> saveNotification(domain.NivaNotification notification) async {
    await database.into(database.notificationRows).insertOnConflictUpdate(
          NotificationRowsCompanion.insert(
            id: notification.id,
            fingerprint: notification.fingerprint,
            priority: notification.priority.name,
            title: notification.title,
            body: notification.body,
            createdAt: notification.createdAt,
            evidenceIds: _encodeList(notification.evidenceIds),
          ),
        );
  }

  @override
  Future<List<domain.RouteProfile>> readRouteProfiles() async {
    final rows = await database.select(database.routeProfiles).get();
    return rows.map(_routeProfileFromRow).toList();
  }

  @override
  Future<void> saveRouteProfile(domain.RouteProfile profile) async {
    await database.into(database.routeProfiles).insertOnConflictUpdate(
          RouteProfilesCompanion.insert(
            id: profile.id,
            originCluster: profile.originCluster,
            destinationCluster: profile.destinationCluster,
            typicalTransport: profile.typicalTransport,
            typicalDurationMinutes: profile.typicalDuration.inMinutes,
            variance: profile.variance,
            dayOfWeek: profile.dayOfWeek,
            timeWindowLabel: profile.timeWindowLabel,
            sampleCount: profile.sampleCount,
            lastUpdated: profile.lastUpdated,
          ),
        );
  }

  @override
  Future<List<domain.RouteObservation>> readRouteObservations(
    String routeProfileId,
  ) async {
    final rows = await (database.select(database.routeObservations)
          ..where((row) => row.routeProfileId.equals(routeProfileId))
          ..orderBy([(table) => OrderingTerm.asc(table.observedAt)]))
        .get();
    return rows.map(_routeObservationFromRow).toList();
  }

  @override
  Future<void> saveRouteObservation(
    domain.RouteObservation observation,
  ) async {
    await database.into(database.routeObservations).insertOnConflictUpdate(
          RouteObservationsCompanion.insert(
            id: observation.id,
            routeProfileId: observation.routeProfileId,
            durationMinutes: observation.duration.inMinutes,
            transport: observation.transport,
            observedAt: observation.observedAt,
            source: observation.source,
          ),
        );
  }

  @override
  Future<List<domain.WeatherEvent>> readWeatherEvents() async {
    final rows = await (database.select(database.weatherEvents)
          ..orderBy([(table) => OrderingTerm.asc(table.startsAt)]))
        .get();
    return rows.map(_weatherEventFromRow).toList();
  }

  @override
  Future<void> saveWeatherEvent(domain.WeatherEvent event) async {
    await database.into(database.weatherEvents).insertOnConflictUpdate(
          WeatherEventsCompanion.insert(
            id: event.id,
            condition: event.condition.name,
            startsAt: event.startsAt,
            endsAt: event.endsAt,
            probability: event.probability,
            severity: event.severity,
            source: event.source,
            fetchedAt: event.fetchedAt,
          ),
        );
  }

  @override
  Future<void> close() => database.close();

  domain.UserProfile _profileFromRow(UserProfileRow row) {
    return domain.UserProfile(
      id: row.id,
      displayName: row.displayName,
      timezone: row.timezone,
      locale: row.locale,
      preferredTone:
          _enumByName(domain.PreferredTone.values, row.preferredTone),
      preferredNotificationLevel: _enumByName(
        domain.NotificationLevel.values,
        row.preferredNotificationLevel,
      ),
      defaultTravelBuffer: Duration(minutes: row.defaultTravelBufferMinutes),
      typicalSleepWindow: TimeWindow(
        startHour: row.sleepStartHour,
        startMinute: row.sleepStartMinute,
        endHour: row.sleepEndHour,
        endMinute: row.sleepEndMinute,
      ),
      typicalWakeWindow: TimeWindow(
        startHour: row.wakeStartHour,
        startMinute: row.wakeStartMinute,
        endHour: row.wakeEndHour,
        endMinute: row.wakeEndMinute,
      ),
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  domain.Memory _memoryFromRow(MemoryRow row) {
    return domain.Memory(
      id: row.id,
      type: _enumByName(domain.MemoryType.values, row.type),
      title: row.title,
      value: row.value,
      source: _enumByName(domain.MemorySource.values, row.source),
      confidence: _enumByName(domain.MemoryConfidence.values, row.confidence),
      condition: row.condition,
      expiresAt: row.expiresAt,
      lastUsedAt: row.lastUsedAt,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  domain.CalendarEvent _calendarEventFromRow(CalendarEventRow row) {
    return domain.CalendarEvent(
      id: row.id,
      title: row.title,
      startsAt: row.startsAt,
      endsAt: row.endsAt,
      locationName: row.locationName,
    );
  }

  domain.PlannerTask _plannerTaskFromRow(PlannerTaskRow row) {
    return domain.PlannerTask(
      id: row.id,
      title: row.title,
      duration: Duration(minutes: row.durationMinutes),
      deadline: row.deadline,
      priority: _enumByName(domain.PlannerTaskPriority.values, row.priority),
      status: _enumByName(domain.PlannerTaskStatus.values, row.status),
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      earliestStart: row.earliestStart,
      notes: row.notes,
    );
  }

  domain.PlanBlock _planBlockFromRow(PlanBlockRow row) {
    return domain.PlanBlock(
      id: row.id,
      type: _enumByName(domain.PlanBlockType.values, row.type),
      title: row.title,
      startsAt: row.startsAt,
      endsAt: row.endsAt,
      evidenceIds: _decodeList(row.evidenceIds),
    );
  }

  domain.AdaptiveAlarm _alarmFromRow(AlarmRow row) {
    return domain.AdaptiveAlarm(
      id: row.id,
      scheduledFor: row.scheduledFor,
      reason: row.reason,
      evidenceIds: _decodeList(row.evidenceIds),
      calculationVersion: row.calculationVersion,
      isActive: row.isActive,
    );
  }

  domain.NivaNotification _notificationFromRow(NotificationRecord row) {
    return domain.NivaNotification(
      id: row.id,
      fingerprint: row.fingerprint,
      priority:
          _enumByName(domain.NivaNotificationPriority.values, row.priority),
      title: row.title,
      body: row.body,
      createdAt: row.createdAt,
      evidenceIds: _decodeList(row.evidenceIds),
    );
  }

  domain.RouteProfile _routeProfileFromRow(RouteProfileRow row) {
    return domain.RouteProfile(
      id: row.id,
      originCluster: row.originCluster,
      destinationCluster: row.destinationCluster,
      typicalTransport: row.typicalTransport,
      typicalDuration: Duration(minutes: row.typicalDurationMinutes),
      variance: row.variance,
      dayOfWeek: row.dayOfWeek,
      timeWindowLabel: row.timeWindowLabel,
      sampleCount: row.sampleCount,
      lastUpdated: row.lastUpdated,
    );
  }

  domain.RouteObservation _routeObservationFromRow(RouteObservationRow row) {
    return domain.RouteObservation(
      id: row.id,
      routeProfileId: row.routeProfileId,
      duration: Duration(minutes: row.durationMinutes),
      transport: row.transport,
      observedAt: row.observedAt,
      source: row.source,
    );
  }

  domain.WeatherEvent _weatherEventFromRow(WeatherEventRow row) {
    return domain.WeatherEvent(
      id: row.id,
      condition: _enumByName(domain.WeatherCondition.values, row.condition),
      startsAt: row.startsAt,
      endsAt: row.endsAt,
      probability: row.probability,
      severity: row.severity,
      source: row.source,
      fetchedAt: row.fetchedAt,
    );
  }

  String _encodeList(List<String> values) => values.join('\n');

  List<String> _decodeList(String encoded) =>
      encoded.isEmpty ? const [] : encoded.split('\n');

  T _enumByName<T extends Enum>(List<T> values, String name) {
    return values.firstWhere((value) => value.name == name);
  }
}
