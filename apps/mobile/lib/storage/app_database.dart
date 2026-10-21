import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DataClassName('PlannerTaskRow')
class PlannerTasks extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get durationMinutes => integer()();
  DateTimeColumn get deadline => dateTime()();
  TextColumn get priority => text()();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get earliestStart => dateTime().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('UserProfileRow')
class UserProfiles extends Table {
  TextColumn get id => text()();
  TextColumn get displayName => text()();
  TextColumn get timezone => text()();
  TextColumn get locale => text()();
  TextColumn get preferredTone => text()();
  TextColumn get preferredNotificationLevel => text()();
  IntColumn get defaultTravelBufferMinutes => integer()();
  IntColumn get sleepStartHour => integer()();
  IntColumn get sleepStartMinute => integer()();
  IntColumn get sleepEndHour => integer()();
  IntColumn get sleepEndMinute => integer()();
  IntColumn get wakeStartHour => integer()();
  IntColumn get wakeStartMinute => integer()();
  IntColumn get wakeEndHour => integer()();
  IntColumn get wakeEndMinute => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('MemoryRow')
class Memories extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()();
  TextColumn get title => text()();
  TextColumn get value => text()();
  TextColumn get source => text()();
  TextColumn get confidence => text()();
  TextColumn get condition => text().nullable()();
  DateTimeColumn get expiresAt => dateTime().nullable()();
  DateTimeColumn get lastUsedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('CalendarEventRow')
class CalendarEvents extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  DateTimeColumn get startsAt => dateTime()();
  DateTimeColumn get endsAt => dateTime()();
  TextColumn get locationName => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('PlanRow')
class Plans extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get evidenceIds => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('PlanBlockRow')
class PlanBlocks extends Table {
  TextColumn get id => text()();
  TextColumn get planId => text().references(Plans, #id)();
  TextColumn get type => text()();
  TextColumn get title => text()();
  DateTimeColumn get startsAt => dateTime()();
  DateTimeColumn get endsAt => dateTime()();
  TextColumn get evidenceIds => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('AlarmRow')
class Alarms extends Table {
  TextColumn get id => text()();
  DateTimeColumn get scheduledFor => dateTime()();
  TextColumn get reason => text()();
  TextColumn get evidenceIds => text()();
  IntColumn get calculationVersion => integer()();
  BoolColumn get isActive => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('NotificationRecord')
class NotificationRows extends Table {
  TextColumn get id => text()();
  TextColumn get fingerprint => text()();
  TextColumn get priority => text()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get evidenceIds => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ReminderRow')
class ReminderRows extends Table {
  TextColumn get key => text()();
  IntColumn get notificationId => integer()();
  TextColumn get ownerId => text()();
  TextColumn get kind => text()();
  DateTimeColumn get scheduledFor => dateTime()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  TextColumn get evidence => text()();
  TextColumn get evidenceIds => text()();
  TextColumn get status => text()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}

@DataClassName('ReminderAuditRow')
class ReminderAuditRows extends Table {
  TextColumn get id => text()();
  TextColumn get reminderKey => text()();
  TextColumn get operation => text()();
  TextColumn get explanation => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('RouteProfileRow')
class RouteProfiles extends Table {
  TextColumn get id => text()();
  TextColumn get originCluster => text()();
  TextColumn get destinationCluster => text()();
  TextColumn get typicalTransport => text()();
  IntColumn get typicalDurationMinutes => integer()();
  RealColumn get variance => real()();
  IntColumn get dayOfWeek => integer()();
  TextColumn get timeWindowLabel => text()();
  IntColumn get sampleCount => integer()();
  DateTimeColumn get lastUpdated => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('RouteObservationRow')
class RouteObservations extends Table {
  TextColumn get id => text()();
  TextColumn get routeProfileId => text().references(RouteProfiles, #id)();
  IntColumn get durationMinutes => integer()();
  TextColumn get transport => text()();
  DateTimeColumn get observedAt => dateTime()();
  TextColumn get source => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('WeatherEventRow')
class WeatherEvents extends Table {
  TextColumn get id => text()();
  TextColumn get condition => text()();
  DateTimeColumn get startsAt => dateTime()();
  DateTimeColumn get endsAt => dateTime()();
  RealColumn get probability => real()();
  IntColumn get severity => integer()();
  TextColumn get source => text()();
  DateTimeColumn get fetchedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    UserProfiles,
    Memories,
    CalendarEvents,
    Plans,
    PlanBlocks,
    Alarms,
    NotificationRows,
    ReminderRows,
    ReminderAuditRows,
    RouteProfiles,
    RouteObservations,
    WeatherEvents,
    PlannerTasks,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await customStatement(
            'CREATE INDEX idx_memories_type ON memories(type);',
          );
          await customStatement(
            'CREATE INDEX idx_memories_expires_at ON memories(expires_at);',
          );
          await customStatement(
            'CREATE INDEX idx_calendar_events_starts_at '
            'ON calendar_events(starts_at);',
          );
          await customStatement(
            'CREATE INDEX idx_plan_blocks_plan_id ON plan_blocks(plan_id);',
          );
          await customStatement(
            'CREATE INDEX idx_weather_events_window '
            'ON weather_events(starts_at, ends_at);',
          );
          await customStatement(
            'CREATE INDEX idx_route_observations_profile '
            'ON route_observations(route_profile_id);',
          );
          await customStatement(
            'CREATE INDEX idx_planner_tasks_deadline '
            'ON planner_tasks(deadline, status);',
          );
          await customStatement(
            'CREATE INDEX idx_reminders_status_time '
            'ON reminder_rows(status, scheduled_for);',
          );
        },
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(plannerTasks);
            await customStatement(
              'CREATE INDEX idx_planner_tasks_deadline '
              'ON planner_tasks(deadline, status);',
            );
          }
          if (from < 3) {
            await m.createTable(reminderRows);
            await m.createTable(reminderAuditRows);
            await customStatement(
              'CREATE INDEX idx_reminders_status_time '
              'ON reminder_rows(status, scheduled_for);',
            );
          }
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(p.join(directory.path, 'niva.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
