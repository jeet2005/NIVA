class AdaptiveAlarm {
  const AdaptiveAlarm({
    required this.id,
    required this.scheduledFor,
    required this.reason,
    required this.evidenceIds,
    required this.calculationVersion,
    required this.isActive,
  });

  final String id;
  final DateTime scheduledFor;
  final String reason;
  final List<String> evidenceIds;
  final int calculationVersion;
  final bool isActive;
}
