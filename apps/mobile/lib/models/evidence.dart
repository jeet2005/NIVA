enum EvidenceSource {
  observed,
  computed,
  retrieved,
  userExplicit,
  inferred,
}

class Evidence {
  const Evidence({
    required this.id,
    required this.source,
    required this.summary,
    required this.timestamp,
    this.confidence,
  });

  final String id;
  final EvidenceSource source;
  final String summary;
  final DateTime timestamp;
  final double? confidence;
}
