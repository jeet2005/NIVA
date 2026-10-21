import 'calendar_event.dart';
import 'memory.dart';
import 'route_profile.dart';
import 'weather.dart';

enum ContextKind {
  event,
  task,
  memory,
  weather,
  route,
  activity,
  plan,
  reminder
}

enum ContextFreshness { current, stale, expired, unknown }

/// A normalized, minimal context fact with provenance and explicit uncertainty.
class ContextItem {
  const ContextItem({
    required this.id,
    required this.kind,
    required this.summary,
    required this.source,
    required this.observedAt,
    required this.freshness,
    required this.confidence,
    this.expiresAt,
    this.known = true,
  });

  final String id;
  final ContextKind kind;
  final String summary;
  final String source;
  final DateTime? observedAt;
  final DateTime? expiresAt;
  final ContextFreshness freshness;
  final double? confidence;
  final bool known;
}

class ContextCandidate {
  const ContextCandidate({
    required this.id,
    required this.domain,
    required this.summary,
    required this.createdAt,
    required this.evidenceIds,
    this.expiresAt,
    this.priority = 0.5,
  });

  final String id;
  final String domain;
  final String summary;
  final DateTime createdAt;
  final DateTime? expiresAt;
  final List<String> evidenceIds;
  final double priority;
}

enum ActivityState { stationary, walking, running, cycling, vehicle, unknown }

class ContextSnapshot {
  const ContextSnapshot({
    required this.createdAt,
    required this.upcomingEvents,
    required this.memories,
    required this.weatherEvents,
    required this.routeEstimate,
    required this.activity,
    required this.activityConfidence,
    required this.activityTimestamp,
    this.items = const [],
    this.unknowns = const [],
    this.contradictions = const [],
  });

  final DateTime createdAt;
  final List<CalendarEvent> upcomingEvents;
  final List<Memory> memories;
  final List<WeatherEvent> weatherEvents;
  final RouteEstimate? routeEstimate;
  final ActivityState activity;
  final double activityConfidence;
  final DateTime activityTimestamp;
  final List<ContextItem> items;
  final List<String> unknowns;
  final List<String> contradictions;

  bool get isAlreadyTravelling =>
      activity == ActivityState.vehicle ||
      activity == ActivityState.walking ||
      activity == ActivityState.cycling;
}
