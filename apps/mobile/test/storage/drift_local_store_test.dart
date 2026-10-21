import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite;
import 'package:niva_mobile/core/time/time_window.dart';
import 'package:niva_mobile/models/calendar_event.dart';
import 'package:niva_mobile/models/alarm.dart';
import 'package:niva_mobile/models/daily_plan.dart';
import 'package:niva_mobile/models/memory.dart';
import 'package:niva_mobile/models/niva_notification.dart';
import 'package:niva_mobile/models/planner_task.dart';
import 'package:niva_mobile/models/route_profile.dart';
import 'package:niva_mobile/models/user_profile.dart';
import 'package:niva_mobile/models/weather.dart';
import 'package:niva_mobile/storage/app_database.dart';
import 'package:niva_mobile/storage/drift_local_store.dart';

void main() {
  test('persists profile, memories, events, plans, routes, and weather',
      () async {
    final file = File('${Directory.systemTemp.path}/niva_store_test.sqlite');
    if (file.existsSync()) {
      file.deleteSync();
    }

    final now = DateTime(2026, 10, 9, 8);
    var database = AppDatabase(NativeDatabase(file));
    var store = DriftLocalStore(database);

    final profile = UserProfile(
      id: 'user',
      displayName: 'Jeet',
      timezone: 'Asia/Calcutta',
      locale: 'en_IN',
      preferredTone: PreferredTone.warm,
      preferredNotificationLevel: NotificationLevel.balanced,
      defaultTravelBuffer: const Duration(minutes: 12),
      typicalSleepWindow: const TimeWindow(
        startHour: 23,
        startMinute: 0,
        endHour: 7,
        endMinute: 0,
      ),
      typicalWakeWindow: const TimeWindow(
        startHour: 6,
        startMinute: 30,
        endHour: 8,
        endMinute: 30,
      ),
      createdAt: now,
      updatedAt: now,
    );
    final memory = Memory(
      id: 'memory',
      type: MemoryType.explicitPreference,
      title: 'Rain transport',
      value: 'car',
      source: MemorySource.explicitUserStatement,
      confidence: MemoryConfidence.high,
      condition: 'weather.rain.transport',
      createdAt: now,
      updatedAt: now,
    );
    final event = CalendarEvent(
      id: 'college',
      title: 'College',
      startsAt: DateTime(2026, 10, 10, 9),
      endsAt: DateTime(2026, 10, 10, 15),
    );
    final plan = DailyPlan(
      id: 'plan',
      date: DateTime(2026, 10, 10),
      blocks: [
        PlanBlock(
          id: 'wake',
          type: PlanBlockType.wake,
          title: 'Wake',
          startsAt: DateTime(2026, 10, 10, 7, 17),
          endsAt: DateTime(2026, 10, 10, 7, 17),
          evidenceIds: const ['event'],
        ),
        PlanBlock(
          id: 'conflict-assignment',
          type: PlanBlockType.conflict,
          title: 'Schedule conflict: Finish assignment',
          startsAt: DateTime(2026, 10, 10, 18),
          endsAt: DateTime(2026, 10, 10, 18),
          evidenceIds: const ['evidence-task-assignment'],
        ),
      ],
      evidenceIds: const ['event'],
      createdAt: now,
      updatedAt: now,
    );
    final route = RouteProfile(
      id: 'home-campus',
      originCluster: 'home',
      destinationCluster: 'campus',
      typicalTransport: 'walking',
      typicalDuration: const Duration(minutes: 43),
      variance: 16,
      dayOfWeek: 5,
      timeWindowLabel: 'morning',
      sampleCount: 3,
      lastUpdated: now,
    );
    final weather = WeatherEvent(
      id: 'rain',
      condition: WeatherCondition.rain,
      startsAt: DateTime(2026, 10, 10, 7),
      endsAt: DateTime(2026, 10, 10, 9),
      probability: 0.8,
      severity: 2,
      source: 'test',
      fetchedAt: now,
    );
    final alarm = AdaptiveAlarm(
      id: 'alarm-plan',
      scheduledFor: DateTime(2026, 10, 10, 7, 17),
      reason: 'Preparation 48 min; College 09:00.',
      evidenceIds: const ['event', 'preparation'],
      calculationVersion: 1,
      isActive: true,
    );
    final notification = NivaNotification(
      id: 'notification-traffic',
      fingerprint: 'traffic-college',
      priority: NivaNotificationPriority.important,
      title: 'Travel delay',
      body: 'Route estimate is slower than usual.',
      createdAt: now,
      evidenceIds: const ['route'],
    );
    final task = PlannerTask(
      id: 'assignment',
      title: 'Finish assignment',
      duration: const Duration(minutes: 60),
      deadline: DateTime(2026, 10, 10, 18),
      priority: PlannerTaskPriority.high,
      status: PlannerTaskStatus.pending,
      createdAt: now,
      updatedAt: now,
    );

    await store.saveProfile(profile);
    await store.saveMemory(memory);
    await store.saveCalendarEvent(event);
    await store.savePlan(plan);
    await store.saveRouteProfile(route);
    await store.saveWeatherEvent(weather);
    await store.saveAlarm(alarm);
    await store.saveNotification(notification);
    await store.saveTask(task);
    await store.close();

    database = AppDatabase(NativeDatabase(file));
    store = DriftLocalStore(database);

    expect((await store.readProfile())!.displayName, 'Jeet');
    expect((await store.readMemories()).single.value, 'car');
    expect((await store.readCalendarEvents()).single.title, 'College');
    expect((await store.readLatestPlan())!.blocks.first.title, 'Wake');
    expect(
      (await store.readLatestPlan())!.conflicts.single.id,
      'conflict-assignment',
    );
    expect((await store.readRouteProfiles()).single.sampleCount, 3);
    expect((await store.readWeatherEvents()).single.condition,
        WeatherCondition.rain);
    expect((await store.readAlarms()).single.reason, alarm.reason);
    expect((await store.readNotificationHistory()).single.fingerprint,
        notification.fingerprint);
    expect((await store.readTasks()).single.title, task.title);
    expect((await store.readTasks()).single.priority, PlannerTaskPriority.high);

    await store.deleteMemory('memory');
    expect(await store.readMemories(), isEmpty);

    await store.close();
    file.deleteSync();
  });

  test('creates versioned schema and time/query indexes', () async {
    final database = AppDatabase(NativeDatabase.memory());
    await database.customSelect('SELECT 1').get();

    expect(database.schemaVersion, 3);

    final indexes = await database
        .customSelect(
          "SELECT name FROM sqlite_master WHERE type = 'index' ORDER BY name",
        )
        .get();
    final names = indexes.map((row) => row.data['name']).toSet();

    expect(names, contains('idx_memories_type'));
    expect(names, contains('idx_calendar_events_starts_at'));
    expect(names, contains('idx_plan_blocks_plan_id'));
    expect(names, contains('idx_weather_events_window'));
    expect(names, contains('idx_planner_tasks_deadline'));
    expect(names, contains('idx_reminders_status_time'));

    await database.close();
  });

  test('upgrades an existing schema version 1 database to version 3', () async {
    final file = File('${Directory.systemTemp.path}/niva_upgrade_test.sqlite');
    if (file.existsSync()) file.deleteSync();
    final legacy = sqlite.sqlite3.open(file.path);
    legacy.execute('PRAGMA user_version = 1');
    legacy.close();

    final database = AppDatabase(NativeDatabase(file));
    final tasks = await database.select(database.plannerTasks).get();
    expect(tasks, isEmpty);
    expect(database.schemaVersion, 3);
    expect(await database.select(database.reminderRows).get(), isEmpty);
    expect(await database.select(database.reminderAuditRows).get(), isEmpty);
    await database.close();
    file.deleteSync();
  });
}
