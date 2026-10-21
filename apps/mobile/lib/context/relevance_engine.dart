import '../models/context_snapshot.dart';
import '../models/memory.dart';
import '../models/relevance.dart';

class RelevanceEngine {
  const RelevanceEngine();

  /// Scores a typed candidate using only fresh, referenced local evidence.
  /// A candidate with no current evidence is never promoted to a user action.
  RelevanceDecision evaluateCandidate(
    ContextSnapshot snapshot,
    ContextCandidate candidate, {
    Iterable<ContextCandidate> existing = const [],
  }) {
    if (candidate.expiresAt != null &&
        !candidate.expiresAt!.isAfter(snapshot.createdAt)) {
      return const RelevanceDecision(
        score: 0,
        action: RecommendedAction.ignore,
        explanation: 'Candidate has expired.',
        evidenceIds: [],
      );
    }
    final duplicate = existing.any((item) =>
        item.domain == candidate.domain &&
        item.id != candidate.id &&
        item.summary.trim().toLowerCase() ==
            candidate.summary.trim().toLowerCase() &&
        item.createdAt.difference(candidate.createdAt).abs() <
            const Duration(hours: 24));
    if (duplicate) {
      return const RelevanceDecision(
        score: 0,
        action: RecommendedAction.ignore,
        explanation: 'A matching candidate already exists in this domain.',
        evidenceIds: [],
      );
    }
    final evidence = snapshot.items
        .where((item) =>
            candidate.evidenceIds.contains(item.id) &&
            item.known &&
            item.freshness == ContextFreshness.current)
        .toList();
    if (evidence.isEmpty) {
      return const RelevanceDecision(
        score: 0.1,
        action: RecommendedAction.ask,
        explanation: 'Current evidence is missing; ask the user before acting.',
        evidenceIds: [],
      );
    }
    final confidence = evidence
        .map((item) => item.confidence ?? 0.4)
        .reduce((a, b) => a < b ? a : b);
    final score =
        (candidate.priority.clamp(0.0, 1.0) * confidence).clamp(0.0, 1.0);
    final action = score >= 0.7
        ? RecommendedAction.notify
        : score >= 0.35
            ? RecommendedAction.observe
            : RecommendedAction.ask;
    return RelevanceDecision(
      score: score,
      action: action,
      explanation:
          'Ranked from ${evidence.length} fresh evidence item(s) in ${candidate.domain}.',
      evidenceIds: evidence.map((item) => item.id).toList(),
    );
  }

  RelevanceDecision evaluateWeather(ContextSnapshot snapshot) {
    final nextEvent =
        snapshot.upcomingEvents.isEmpty ? null : snapshot.upcomingEvents.first;
    if (nextEvent == null || snapshot.routeEstimate == null) {
      return const RelevanceDecision(
        score: 0,
        action: RecommendedAction.ignore,
        explanation: 'No upcoming travel commitment is affected.',
        evidenceIds: [],
      );
    }

    final commuteStart =
        nextEvent.startsAt.subtract(snapshot.routeEstimate!.duration);
    final relevantWeather = snapshot.weatherEvents.where(
      (event) =>
          event.isRainLike &&
          event.overlaps(commuteStart, nextEvent.startsAt) &&
          event.probability >= 0.4,
    );
    if (relevantWeather.isEmpty) {
      return const RelevanceDecision(
        score: 0,
        action: RecommendedAction.ignore,
        explanation: 'No relevant weather overlaps the next commute.',
        evidenceIds: [],
      );
    }

    final carContext = snapshot.memories.any(
      (memory) =>
          !memory.isExpired(snapshot.createdAt) &&
          (memory.condition == 'transport.tomorrow' ||
              memory.condition == 'weather.rain.transport') &&
          memory.value == 'car' &&
          (memory.type == MemoryType.temporaryContext ||
              memory.type == MemoryType.explicitPreference),
    );
    if (carContext) {
      return RelevanceDecision(
        score: 0.25,
        action: RecommendedAction.observe,
        explanation:
            'Rain overlaps the commute, but current transport context says car.',
        evidenceIds: relevantWeather.map((event) => event.id).toList(),
      );
    }

    final severity = relevantWeather
        .map((event) => event.severity)
        .fold<int>(0, (max, value) => value > max ? value : max);
    final score = severity >= 3 ? 0.85 : 0.65;
    return RelevanceDecision(
      score: score,
      action: score >= 0.8
          ? RecommendedAction.reschedule
          : RecommendedAction.notify,
      explanation: 'Rain overlaps the next commute and may affect the plan.',
      evidenceIds: relevantWeather.map((event) => event.id).toList(),
    );
  }

  RelevanceDecision evaluateTraffic(ContextSnapshot snapshot) {
    final estimate = snapshot.routeEstimate;
    if (estimate == null || snapshot.upcomingEvents.isEmpty) {
      return const RelevanceDecision(
        score: 0,
        action: RecommendedAction.ignore,
        explanation: 'No route estimate is available for an upcoming event.',
        evidenceIds: [],
      );
    }

    final delayMinutes = estimate.delay.inMinutes;
    if (delayMinutes < 10) {
      return const RelevanceDecision(
        score: 0.2,
        action: RecommendedAction.observe,
        explanation: 'Traffic is not meaningfully slower than usual.',
        evidenceIds: [],
      );
    }

    if (snapshot.isAlreadyTravelling) {
      return const RelevanceDecision(
        score: 0.35,
        action: RecommendedAction.observe,
        explanation: 'The user appears to already be travelling.',
        evidenceIds: [],
      );
    }

    return RelevanceDecision(
      score: delayMinutes >= 20 ? 0.9 : 0.75,
      action: RecommendedAction.reschedule,
      explanation: 'Traffic is meaningfully slower than the route baseline.',
      evidenceIds: [estimate.routeProfileId],
    );
  }
}
