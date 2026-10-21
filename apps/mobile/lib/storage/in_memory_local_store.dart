import 'local_store.dart';
import '../models/alarm.dart';
import '../models/calendar_event.dart';
import '../models/daily_plan.dart';
import '../models/memory.dart';
import '../models/niva_notification.dart';
import '../models/planner_task.dart';
import '../models/reminder_record.dart';
import '../models/route_profile.dart';
import '../models/user_profile.dart';
import '../models/weather.dart';

class InMemoryLocalStore implements LocalStore {
  UserProfile? _profile;
  final _memories = <Memory>[];
  final _events = <CalendarEvent>[];
  final _tasks = <PlannerTask>[];
  final _alarms = <AdaptiveAlarm>[];
  final _reminders = <ReminderRecord>[];
  final _reminderAudits = <ReminderAudit>[];
  final _notifications = <NivaNotification>[];
  final _routeProfiles = <RouteProfile>[];
  final _routeObservations = <RouteObservation>[];
  final _weatherEvents = <WeatherEvent>[];
  DailyPlan? _latestPlan;

  @override
  Future<UserProfile?> readProfile() async => _profile;

  @override
  Future<void> saveProfile(UserProfile profile) async {
    _profile = profile;
  }

  @override
  Future<List<Memory>> readMemories() async => List.unmodifiable(_memories);

  @override
  Future<void> saveMemory(Memory memory) async {
    _memories.removeWhere((existing) => existing.id == memory.id);
    _memories.add(memory);
  }

  @override
  Future<void> deleteMemory(String id) async {
    _memories.removeWhere((existing) => existing.id == id);
  }

  @override
  Future<List<CalendarEvent>> readCalendarEvents() async =>
      List.unmodifiable(_events);

  @override
  Future<void> saveCalendarEvent(CalendarEvent event) async {
    _events.removeWhere((existing) => existing.id == event.id);
    _events.add(event);
  }

  @override
  Future<void> deleteCalendarEvent(String id) async {
    _events.removeWhere((existing) => existing.id == id);
  }

  @override
  Future<List<PlannerTask>> readTasks() async => List.unmodifiable(_tasks);

  @override
  Future<void> saveTask(PlannerTask task) async {
    _tasks.removeWhere((existing) => existing.id == task.id);
    _tasks.add(task);
  }

  @override
  Future<DailyPlan?> readLatestPlan() async => _latestPlan;

  @override
  Future<void> savePlan(DailyPlan plan) async {
    _latestPlan = plan;
  }

  @override
  Future<List<AdaptiveAlarm>> readAlarms() async => List.unmodifiable(_alarms);

  @override
  Future<void> saveAlarm(AdaptiveAlarm alarm) async {
    _alarms.removeWhere((existing) => existing.id == alarm.id);
    _alarms.add(alarm);
  }

  @override
  Future<List<ReminderRecord>> readReminders() async =>
      List.unmodifiable(_reminders);

  @override
  Future<void> saveReminder(ReminderRecord reminder) async {
    _reminders.removeWhere((existing) => existing.key == reminder.key);
    _reminders.add(reminder);
  }

  @override
  Future<List<ReminderAudit>> readReminderAudits() async =>
      List.unmodifiable(_reminderAudits);

  @override
  Future<void> saveReminderAudit(ReminderAudit audit) async {
    _reminderAudits.removeWhere((existing) => existing.id == audit.id);
    _reminderAudits.add(audit);
  }

  @override
  Future<List<NivaNotification>> readNotificationHistory() async =>
      List.unmodifiable(_notifications);

  @override
  Future<void> saveNotification(NivaNotification notification) async {
    _notifications.removeWhere((existing) => existing.id == notification.id);
    _notifications.add(notification);
  }

  @override
  Future<List<RouteProfile>> readRouteProfiles() async =>
      List.unmodifiable(_routeProfiles);

  @override
  Future<void> saveRouteProfile(RouteProfile profile) async {
    _routeProfiles.removeWhere((existing) => existing.id == profile.id);
    _routeProfiles.add(profile);
  }

  @override
  Future<List<RouteObservation>> readRouteObservations(
    String routeProfileId,
  ) async {
    return _routeObservations
        .where((observation) => observation.routeProfileId == routeProfileId)
        .toList();
  }

  @override
  Future<void> saveRouteObservation(RouteObservation observation) async {
    _routeObservations.removeWhere((existing) => existing.id == observation.id);
    _routeObservations.add(observation);
  }

  @override
  Future<List<WeatherEvent>> readWeatherEvents() async =>
      List.unmodifiable(_weatherEvents);

  @override
  Future<void> saveWeatherEvent(WeatherEvent event) async {
    _weatherEvents.removeWhere((existing) => existing.id == event.id);
    _weatherEvents.add(event);
  }

  @override
  Future<void> close() async {}
}
