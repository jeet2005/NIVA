enum RecommendedAction { ignore, observe, notify, suggest, ask, reschedule }

class RelevanceDecision {
  const RelevanceDecision({
    required this.score,
    required this.action,
    required this.explanation,
    required this.evidenceIds,
  });

  final double score;
  final RecommendedAction action;
  final String explanation;
  final List<String> evidenceIds;
}
