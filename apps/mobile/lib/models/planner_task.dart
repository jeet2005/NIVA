enum PlannerTaskStatus { pending, completed, cancelled }

enum PlannerTaskPriority { low, normal, high, urgent }

class PlannerTask {
  const PlannerTask({
    required this.id,
    required this.title,
    required this.duration,
    required this.deadline,
    required this.priority,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.earliestStart,
    this.notes,
  });

  final String id;
  final String title;
  final Duration duration;
  final DateTime deadline;
  final PlannerTaskPriority priority;
  final PlannerTaskStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? earliestStart;
  final String? notes;

  PlannerTask copyWith({
    String? title,
    Duration? duration,
    DateTime? deadline,
    PlannerTaskPriority? priority,
    PlannerTaskStatus? status,
    DateTime? updatedAt,
    DateTime? earliestStart,
    String? notes,
  }) =>
      PlannerTask(
        id: id,
        title: title ?? this.title,
        duration: duration ?? this.duration,
        deadline: deadline ?? this.deadline,
        priority: priority ?? this.priority,
        status: status ?? this.status,
        createdAt: createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        earliestStart: earliestStart ?? this.earliestStart,
        notes: notes ?? this.notes,
      );
}
