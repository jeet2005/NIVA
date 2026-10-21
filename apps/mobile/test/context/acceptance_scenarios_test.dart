import 'package:flutter_test/flutter_test.dart';
import 'package:niva_mobile/context/relevance_engine.dart';
import 'package:niva_mobile/models/calendar_event.dart';
import 'package:niva_mobile/models/context_snapshot.dart';
import 'package:niva_mobile/models/memory.dart';
import 'package:niva_mobile/models/route_profile.dart';
import 'package:niva_mobile/models/weather.dart';
import 'package:niva_mobile/models/relevance.dart';
import 'package:niva_mobile/planning/planning_engine.dart';
import 'package:niva_mobile/models/daily_plan.dart';

void main() {
  final now = DateTime(2026, 10, 8, 7);
  final eventStart = DateTime(2026, 10, 9, 9);
  final college = CalendarEvent(
    id: 'college',
    title: 'College',
    startsAt: eventStart,
    endsAt: eventStart.add(const Duration(hours: 6)),
  );

  ContextSnapshot snapshot({
    List<Memory> memories = const [],
    List<WeatherEvent> weather = const [],
    ActivityState activity = ActivityState.stationary,
    int currentMinutes = 43,
  }) =>
      ContextSnapshot(
        createdAt: now,
        upcomingEvents: [college],
        memories: memories,
        weatherEvents: weather,
        routeEstimate: RouteEstimate(
          routeProfileId: 'home-college',
          duration: Duration(minutes: currentMinutes),
          normalDuration: const Duration(minutes: 43),
          source: 'test_fixture',
          fetchedAt: now,
        ),
        activity: activity,
        activityConfidence: 1,
        activityTimestamp: now,
      );

  test('normal day makes a deterministic plan without a notification', () {
    final context = snapshot();
    final weather = const RelevanceEngine().evaluateWeather(context);
    final result = const PlanningEngine().buildDailyPlan(PlanningInput(
      date: eventStart,
      events: [college],
      memories: const [],
      preparationDuration: const Duration(minutes: 48),
      travelDuration: const Duration(minutes: 43),
      defaultBuffer: const Duration(minutes: 12),
      now: now,
      routeEstimate: context.routeEstimate,
      weatherDecision: weather,
    ));
    expect(result.plan.firstBlockOfType(PlanBlockType.wake)!.startsAt,
        DateTime(2026, 10, 9, 7, 17));
    expect(weather.action, RecommendedAction.ignore);
  });

  test('rain is relevant to a walk commute but car context suppresses it', () {
    final rain = WeatherEvent(
      id: 'rain',
      condition: WeatherCondition.rain,
      startsAt: DateTime(2026, 10, 9, 7),
      endsAt: DateTime(2026, 10, 9, 9),
      probability: 0.8,
      severity: 2,
      source: 'test_fixture',
      fetchedAt: now,
    );
    final walkDecision = const RelevanceEngine().evaluateWeather(
      snapshot(weather: [rain]),
    );
    final car = Memory(
      id: 'car',
      type: MemoryType.temporaryContext,
      title: 'Transport tomorrow',
      value: 'car',
      source: MemorySource.explicitUserStatement,
      confidence: MemoryConfidence.high,
      condition: 'transport.tomorrow',
      createdAt: now,
      updatedAt: now,
    );
    final carDecision = const RelevanceEngine().evaluateWeather(
      snapshot(weather: [rain], memories: [car]),
    );
    expect(walkDecision.action, RecommendedAction.notify);
    expect(carDecision.action, RecommendedAction.observe);
  });

  test('heavy traffic produces plus nineteen minutes and replanning', () {
    final context = snapshot(currentMinutes: 62);
    final decision = const RelevanceEngine().evaluateTraffic(context);
    final result = const PlanningEngine().buildDailyPlan(PlanningInput(
      date: eventStart,
      events: [college],
      memories: const [],
      preparationDuration: const Duration(minutes: 48),
      travelDuration: const Duration(minutes: 43),
      defaultBuffer: const Duration(minutes: 12),
      now: now,
      routeEstimate: context.routeEstimate,
    ));
    expect(context.routeEstimate!.delay, const Duration(minutes: 19));
    expect(decision.action, RecommendedAction.reschedule);
    expect(result.plan.firstBlockOfType(PlanBlockType.departure)!.startsAt,
        DateTime(2026, 10, 9, 7, 46));
  });

  test('already travelling suppresses obsolete traffic action', () {
    final decision = const RelevanceEngine().evaluateTraffic(
      snapshot(currentMinutes: 62, activity: ActivityState.vehicle),
    );
    expect(decision.action, RecommendedAction.observe);
  });

  test('no relevant event means rain is ignored', () {
    final context = ContextSnapshot(
      createdAt: now,
      upcomingEvents: const [],
      memories: const [],
      weatherEvents: [
        WeatherEvent(
          id: 'rain',
          condition: WeatherCondition.rain,
          startsAt: now,
          endsAt: now.add(const Duration(hours: 2)),
          probability: 0.9,
          severity: 3,
          source: 'test_fixture',
          fetchedAt: now,
        )
      ],
      routeEstimate: null,
      activity: ActivityState.stationary,
      activityConfidence: 1,
      activityTimestamp: now,
    );
    expect(const RelevanceEngine().evaluateWeather(context).action,
        RecommendedAction.ignore);
  });
}
