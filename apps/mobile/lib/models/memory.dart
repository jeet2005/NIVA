enum MemoryType { explicitPreference, temporaryContext, observedPattern }

enum MemorySource { explicitUserStatement, userCorrection, observedBehavior }

enum MemoryConfidence { low, medium, high }

class Memory {
  const Memory({
    required this.id,
    required this.type,
    required this.title,
    required this.value,
    required this.source,
    required this.confidence,
    required this.createdAt,
    required this.updatedAt,
    this.condition,
    this.expiresAt,
    this.lastUsedAt,
  });

  final String id;
  final MemoryType type;
  final String title;
  final String value;
  final MemorySource source;
  final MemoryConfidence confidence;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? condition;
  final DateTime? expiresAt;
  final DateTime? lastUsedAt;

  bool isExpired(DateTime now) => expiresAt != null && !expiresAt!.isAfter(now);
}
