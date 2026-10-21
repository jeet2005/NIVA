import '../models/memory.dart';

class MemoryService {
  const MemoryService();

  static const _priority = <MemoryType, int>{
    MemoryType.observedPattern: 1,
    MemoryType.temporaryContext: 2,
    MemoryType.explicitPreference: 3,
  };

  Memory? highestPriorityMemory(
    List<Memory> memories, {
    required String condition,
    required DateTime now,
  }) {
    final active = memories
        .where((memory) => memory.condition == condition)
        .where((memory) => !memory.isExpired(now))
        .toList()
      ..sort((a, b) {
        final priorityCompare =
            _priority[b.type]!.compareTo(_priority[a.type]!);
        if (priorityCompare != 0) {
          return priorityCompare;
        }
        return b.updatedAt.compareTo(a.updatedAt);
      });

    return active.isEmpty ? null : active.first;
  }

  Memory recordCorrection({
    required String id,
    required String title,
    required String value,
    required String condition,
    required DateTime now,
  }) {
    return Memory(
      id: id,
      type: MemoryType.explicitPreference,
      title: title,
      value: value,
      source: MemorySource.userCorrection,
      confidence: MemoryConfidence.high,
      condition: condition,
      createdAt: now,
      updatedAt: now,
    );
  }
}
