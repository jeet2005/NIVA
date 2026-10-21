enum PlanBlockType {
  wake,
  preparation,
  departure,
  travel,
  event,
  buffer,
  task,
  conflict,
  rest
}

class PlanBlock {
  const PlanBlock({
    required this.id,
    required this.type,
    required this.title,
    required this.startsAt,
    required this.endsAt,
    required this.evidenceIds,
  });

  final String id;
  final PlanBlockType type;
  final String title;
  final DateTime startsAt;
  final DateTime endsAt;
  final List<String> evidenceIds;
}

class DailyPlan {
  const DailyPlan({
    required this.id,
    required this.date,
    required this.blocks,
    required this.evidenceIds,
    required this.createdAt,
    required this.updatedAt,
    this.conflicts = const [],
  });

  final String id;
  final DateTime date;
  final List<PlanBlock> blocks;
  final List<String> evidenceIds;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<PlanConflict> conflicts;

  PlanBlock? firstBlockOfType(PlanBlockType type) {
    for (final block in blocks) {
      if (block.type == type) {
        return block;
      }
    }
    return null;
  }
}

class PlanConflict {
  const PlanConflict({
    required this.id,
    required this.summary,
    required this.affectedItemIds,
    required this.deadline,
    required this.evidenceIds,
  });

  final String id;
  final String summary;
  final List<String> affectedItemIds;
  final DateTime deadline;
  final List<String> evidenceIds;
}
