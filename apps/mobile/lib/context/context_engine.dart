import '../models/calendar_event.dart';
import '../models/context_snapshot.dart';
import '../models/daily_plan.dart';
import '../models/memory.dart';
import '../models/planner_task.dart';
import '../models/reminder_record.dart';
import '../models/route_profile.dart';
import '../models/weather.dart';

class ContextEngine {
  const ContextEngine();

  ContextSnapshot buildSnapshot({
    required DateTime now,
    required List<CalendarEvent> upcomingEvents,
    required List<Memory> memories,
    required List<WeatherEvent> weatherEvents,
    required RouteEstimate? routeEstimate,
    required ActivityState activity,
    required double activityConfidence,
    required DateTime activityTimestamp,
    List<PlannerTask> tasks = const [],
    DailyPlan? plan,
    List<ReminderRecord> reminders = const [],
  }) {
    final activeMemories =
        memories.where((memory) => !memory.isExpired(now)).toList();
    final items = <ContextItem>[
      for (final event in upcomingEvents)
        ContextItem(
          id: 'event:${event.id}',
          kind: ContextKind.event,
          summary: '${event.title} ${event.startsAt.toIso8601String()}',
          source: 'local_calendar',
          observedAt: now,
          freshness: ContextFreshness.current,
          confidence: 1,
        ),
      for (final task
          in tasks.where((task) => task.status == PlannerTaskStatus.pending))
        ContextItem(
          id: 'task:${task.id}',
          kind: ContextKind.task,
          summary:
              '${task.title}; deadline ${task.deadline.toIso8601String()}; priority ${task.priority.name}',
          source: 'local_task',
          observedAt: task.updatedAt,
          freshness: ContextFreshness.current,
          confidence: 1,
        ),
      for (final memory in activeMemories)
        ContextItem(
          id: 'memory:${memory.id}',
          kind: ContextKind.memory,
          summary: '${memory.title}: ${memory.value}',
          source: memory.source.name,
          observedAt: memory.updatedAt,
          expiresAt: memory.expiresAt,
          freshness: memory.expiresAt == null
              ? ContextFreshness.current
              : ContextFreshness.current,
          confidence: switch (memory.confidence) {
            MemoryConfidence.high => 0.95,
            MemoryConfidence.medium => 0.65,
            MemoryConfidence.low => 0.35
          },
        ),
      for (final weather in weatherEvents)
        ContextItem(
          id: 'weather:${weather.id}',
          kind: ContextKind.weather,
          summary:
              '${weather.condition.name}, probability ${weather.probability}',
          source: weather.source,
          observedAt: weather.fetchedAt,
          freshness:
              now.difference(weather.fetchedAt) > const Duration(hours: 6)
                  ? ContextFreshness.stale
                  : ContextFreshness.current,
          confidence: weather.probability,
        ),
      if (routeEstimate != null)
        ContextItem(
          id: 'route:${routeEstimate.routeProfileId}',
          kind: ContextKind.route,
          summary: '${routeEstimate.duration.inMinutes} minute estimate',
          source: routeEstimate.source,
          observedAt: routeEstimate.fetchedAt,
          freshness: now.difference(routeEstimate.fetchedAt) >
                  const Duration(hours: 12)
              ? ContextFreshness.stale
              : ContextFreshness.current,
          confidence: 0.7,
        ),
      ContextItem(
        id: 'activity:current',
        kind: ContextKind.activity,
        summary: activity.name,
        source: 'device_or_local_state',
        observedAt: activityTimestamp,
        freshness:
            now.difference(activityTimestamp) > const Duration(minutes: 30)
                ? ContextFreshness.stale
                : ContextFreshness.current,
        confidence: activityConfidence,
      ),
      if (plan != null)
        ContextItem(
          id: 'plan:${plan.id}',
          kind: ContextKind.plan,
          summary: '${plan.blocks.length} saved plan blocks',
          source: 'local_plan',
          observedAt: plan.updatedAt,
          freshness: ContextFreshness.current,
          confidence: 1,
        ),
      for (final reminder in reminders.where((item) =>
          item.status == ReminderStatus.scheduled ||
          item.status == ReminderStatus.waitingPermission))
        ContextItem(
          id: 'reminder:${reminder.key}',
          kind: ContextKind.reminder,
          summary:
              '${reminder.kind.name} for ${reminder.ownerId} at ${reminder.scheduledFor.toIso8601String()}; ${reminder.status.name}',
          source: 'local_reminder_store',
          observedAt: reminder.updatedAt,
          freshness: reminder.scheduledFor.isAfter(now)
              ? ContextFreshness.current
              : ContextFreshness.expired,
          confidence: 1,
        ),
    ];
    return ContextSnapshot(
      createdAt: now,
      upcomingEvents: upcomingEvents,
      memories: activeMemories,
      weatherEvents: weatherEvents,
      routeEstimate: routeEstimate,
      activity: activity,
      activityConfidence: activityConfidence,
      activityTimestamp: activityTimestamp,
      items: items,
      unknowns: [
        if (upcomingEvents.isEmpty) 'No calendar events are available.',
        if (weatherEvents.isEmpty) 'No weather source is connected.',
        if (routeEstimate == null) 'No current route estimate is available.',
      ],
      contradictions: _findMemoryContradictions(activeMemories),
    );
  }

  List<String> _findMemoryContradictions(List<Memory> memories) {
    final valuesByCondition = <String, Set<String>>{};
    for (final memory in memories) {
      final condition = memory.condition;
      if (condition == null) continue;
      valuesByCondition
          .putIfAbsent(condition, () => <String>{})
          .add(memory.value);
    }
    return [
      for (final entry in valuesByCondition.entries)
        if (entry.value.length > 1)
          'Multiple active memory values for ${entry.key}; existing memory precedence applies.',
    ];
  }
}
