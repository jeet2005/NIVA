import 'package:flutter_test/flutter_test.dart';
import 'package:niva_mobile/context/relevance_engine.dart';
import 'package:niva_mobile/models/calendar_event.dart';
import 'package:niva_mobile/models/context_snapshot.dart';
import 'package:niva_mobile/models/memory.dart';
import 'package:niva_mobile/models/relevance.dart';
import 'package:niva_mobile/models/route_profile.dart';
import 'package:niva_mobile/models/weather.dart';

void main() {
  test('ignores rain when there is no upcoming travel commitment', () {
    final now = DateTime(2026, 10, 8, 8);
    final decision = const RelevanceEngine().evaluateWeather(
      ContextSnapshot(
        createdAt: now,
        upcomingEvents: const [],
        memories: const [],
        weatherEvents: [
          WeatherEvent(
            id: 'rain',
            condition: WeatherCondition.rain,
            startsAt: now,
            endsAt: now.add(const Duration(hours: 2)),
            probability: 0.8,
            severity: 2,
            source: 'test',
            fetchedAt: now,
          ),
        ],
        routeEstimate: null,
        activity: ActivityState.stationary,
        activityConfidence: 1,
        activityTimestamp: now,
      ),
    );

    expect(decision.action, RecommendedAction.ignore);
  });

  test('observes rain without rescheduling when car context is active', () {
    final now = DateTime(2026, 10, 8, 8);
    final eventStart = DateTime(2026, 10, 8, 9);
    final decision = const RelevanceEngine().evaluateWeather(
      ContextSnapshot(
        createdAt: now,
        upcomingEvents: [
          CalendarEvent(
            id: 'college',
            title: 'College',
            startsAt: eventStart,
            endsAt: eventStart.add(const Duration(hours: 1)),
          ),
        ],
        memories: [
          Memory(
            id: 'car',
            type: MemoryType.temporaryContext,
            title: 'Transport',
            value: 'car',
            source: MemorySource.explicitUserStatement,
            confidence: MemoryConfidence.high,
            condition: 'transport.tomorrow',
            createdAt: now,
            updatedAt: now,
          ),
        ],
        weatherEvents: [
          WeatherEvent(
            id: 'rain',
            condition: WeatherCondition.rain,
            startsAt: now,
            endsAt: now.add(const Duration(hours: 2)),
            probability: 0.8,
            severity: 2,
            source: 'test',
            fetchedAt: now,
          ),
        ],
        routeEstimate: RouteEstimate(
          routeProfileId: 'home-campus',
          duration: const Duration(minutes: 30),
          normalDuration: const Duration(minutes: 43),
          source: 'test',
          fetchedAt: now,
        ),
        activity: ActivityState.stationary,
        activityConfidence: 1,
        activityTimestamp: now,
      ),
    );

    expect(decision.action, RecommendedAction.observe);
  });

  test('traffic delay recommends reschedule when user has not left', () {
    final now = DateTime(2026, 10, 8, 8);
    final eventStart = DateTime(2026, 10, 8, 9);
    final decision = const RelevanceEngine().evaluateTraffic(
      ContextSnapshot(
        createdAt: now,
        upcomingEvents: [
          CalendarEvent(
            id: 'college',
            title: 'College',
            startsAt: eventStart,
            endsAt: eventStart.add(const Duration(hours: 1)),
          ),
        ],
        memories: const [],
        weatherEvents: const [],
        routeEstimate: RouteEstimate(
          routeProfileId: 'home-campus',
          duration: const Duration(minutes: 62),
          normalDuration: const Duration(minutes: 43),
          source: 'test',
          fetchedAt: now,
        ),
        activity: ActivityState.stationary,
        activityConfidence: 1,
        activityTimestamp: now,
      ),
    );

    expect(decision.action, RecommendedAction.reschedule);
    expect(decision.score, greaterThan(0.7));
  });

  test('traffic delay is suppressed after the user has started travelling', () {
    final now = DateTime(2026, 10, 8, 8);
    final eventStart = DateTime(2026, 10, 8, 9);
    final decision = const RelevanceEngine().evaluateTraffic(
      ContextSnapshot(
        createdAt: now,
        upcomingEvents: [
          CalendarEvent(
            id: 'college',
            title: 'College',
            startsAt: eventStart,
            endsAt: eventStart.add(const Duration(hours: 1)),
          ),
        ],
        memories: const [],
        weatherEvents: const [],
        routeEstimate: RouteEstimate(
          routeProfileId: 'route',
          duration: const Duration(minutes: 62),
          normalDuration: const Duration(minutes: 43),
          source: 'test',
          fetchedAt: now,
        ),
        activity: ActivityState.vehicle,
        activityConfidence: 1,
        activityTimestamp: now,
      ),
    );

    expect(decision.action, RecommendedAction.observe);
  });

  test('ignores a small traffic change', () {
    final now = DateTime(2026, 10, 8, 8);
    final eventStart = DateTime(2026, 10, 8, 9);
    final decision = const RelevanceEngine().evaluateTraffic(
      ContextSnapshot(
        createdAt: now,
        upcomingEvents: [
          CalendarEvent(
            id: 'college',
            title: 'College',
            startsAt: eventStart,
            endsAt: eventStart.add(const Duration(hours: 1)),
          ),
        ],
        memories: const [],
        weatherEvents: const [],
        routeEstimate: RouteEstimate(
          routeProfileId: 'route',
          duration: const Duration(minutes: 47),
          normalDuration: const Duration(minutes: 43),
          source: 'test',
          fetchedAt: now,
        ),
        activity: ActivityState.stationary,
        activityConfidence: 1,
        activityTimestamp: now,
      ),
    );

    expect(decision.action, RecommendedAction.observe);
  });
}
