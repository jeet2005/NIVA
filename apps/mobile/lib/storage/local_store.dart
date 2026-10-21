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

abstract interface class LocalStore {
  Future<UserProfile?> readProfile();

  Future<void> saveProfile(UserProfile profile);

  Future<List<Memory>> readMemories();

  Future<void> saveMemory(Memory memory);

  Future<void> deleteMemory(String id);

  Future<List<CalendarEvent>> readCalendarEvents();

  Future<void> saveCalendarEvent(CalendarEvent event);

  Future<void> deleteCalendarEvent(String id);

  Future<List<PlannerTask>> readTasks();

  Future<void> saveTask(PlannerTask task);

  Future<DailyPlan?> readLatestPlan();

  Future<void> savePlan(DailyPlan plan);

  Future<List<AdaptiveAlarm>> readAlarms();

  Future<void> saveAlarm(AdaptiveAlarm alarm);

  Future<List<ReminderRecord>> readReminders();

  Future<void> saveReminder(ReminderRecord reminder);

  Future<List<ReminderAudit>> readReminderAudits();

  Future<void> saveReminderAudit(ReminderAudit audit);

  Future<List<NivaNotification>> readNotificationHistory();

  Future<void> saveNotification(NivaNotification notification);

  Future<List<RouteProfile>> readRouteProfiles();

  Future<void> saveRouteProfile(RouteProfile profile);

  Future<List<RouteObservation>> readRouteObservations(String routeProfileId);

  Future<void> saveRouteObservation(RouteObservation observation);

  Future<List<WeatherEvent>> readWeatherEvents();

  Future<void> saveWeatherEvent(WeatherEvent event);

  Future<void> close();
}
