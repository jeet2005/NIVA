import '../models/calendar_event.dart';
import '../models/daily_plan.dart';
import '../models/evidence.dart';
import '../models/memory.dart';
import '../models/planner_task.dart';
import '../models/relevance.dart';
import '../models/route_profile.dart';
import '../models/weather.dart';

class PlanningInput {
  const PlanningInput({
    required this.date,
    required this.events,
    required this.memories,
    required this.preparationDuration,
    required this.travelDuration,
    required this.defaultBuffer,
    required this.now,
    this.tasks = const [],
    this.planningDayStartHour = 9,
    this.routeEstimate,
    this.weatherEvents = const [],
    this.weatherDecision,
  });

  final DateTime date;
  final List<CalendarEvent> events;
  final List<Memory> memories;
  final Duration preparationDuration;
  final Duration travelDuration;
  final Duration defaultBuffer;
  final DateTime now;
  final List<PlannerTask> tasks;
  final int planningDayStartHour;
  final RouteEstimate? routeEstimate;
  final List<WeatherEvent> weatherEvents;
  final RelevanceDecision? weatherDecision;
}

class PlanningResult {
  const PlanningResult({
    required this.plan,
    required this.evidence,
  });

  final DailyPlan plan;
  final List<Evidence> evidence;
}

class PlanningEngine {
  const PlanningEngine();

  PlanningResult buildDailyPlan(PlanningInput input) {
    if (input.events.isEmpty && input.tasks.isEmpty) {
      final plan = DailyPlan(
        id: 'plan-${input.date.toIso8601String()}',
        date: input.date,
        blocks: const [],
        evidenceIds: const [],
        createdAt: input.now,
        updatedAt: input.now,
      );
      return PlanningResult(plan: plan, evidence: const []);
    }

    final sortedEvents = [...input.events]
      ..sort((a, b) => a.startsAt.compareTo(b.startsAt));
    final firstEvent = sortedEvents.isEmpty ? null : sortedEvents.first;
    final eventEvidence = firstEvent == null
        ? null
        : Evidence(
            id: 'evidence-event-${firstEvent.id}',
            source: EvidenceSource.retrieved,
            summary: '${firstEvent.title} starts at ${firstEvent.startsAt}',
            timestamp: input.now,
            confidence: 1,
          );
    final prepEvidence = Evidence(
      id: 'evidence-preparation',
      source: EvidenceSource.computed,
      summary:
          'Preparation duration ${input.preparationDuration.inMinutes} min',
      timestamp: input.now,
      confidence: 1,
    );
    final effectiveTravelDuration =
        input.routeEstimate?.duration ?? input.travelDuration;
    final hasTravelEstimate =
        firstEvent != null && effectiveTravelDuration > Duration.zero;
    final travelEvidence = hasTravelEstimate
        ? Evidence(
            id: 'evidence-travel',
            source: input.routeEstimate == null
                ? EvidenceSource.computed
                : EvidenceSource.retrieved,
            summary: 'Travel duration ${effectiveTravelDuration.inMinutes} min',
            timestamp: input.now,
            confidence: 1,
          )
        : null;
    final bufferEvidence = Evidence(
      id: 'evidence-buffer',
      source: EvidenceSource.computed,
      summary: 'Buffer ${input.defaultBuffer.inMinutes} min',
      timestamp: input.now,
      confidence: 1,
    );
    final evidenceIds = [
      if (eventEvidence != null) eventEvidence.id,
      prepEvidence.id,
      if (travelEvidence != null) travelEvidence.id,
      bufferEvidence.id,
      if (input.weatherDecision != null &&
          input.weatherDecision!.action != RecommendedAction.ignore)
        'evidence-weather',
    ];

    final blocks = <PlanBlock>[
      if (firstEvent != null && hasTravelEstimate) ...[
        PlanBlock(
          id: 'wake-${firstEvent.id}',
          type: PlanBlockType.wake,
          title: 'Wake',
          startsAt: firstEvent.startsAt
              .subtract(effectiveTravelDuration)
              .subtract(input.defaultBuffer)
              .subtract(input.preparationDuration),
          endsAt: firstEvent.startsAt
              .subtract(effectiveTravelDuration)
              .subtract(input.defaultBuffer)
              .subtract(input.preparationDuration),
          evidenceIds: evidenceIds,
        ),
        PlanBlock(
          id: 'prep-${firstEvent.id}',
          type: PlanBlockType.preparation,
          title: 'Preparation',
          startsAt: firstEvent.startsAt
              .subtract(effectiveTravelDuration)
              .subtract(input.defaultBuffer)
              .subtract(input.preparationDuration),
          endsAt: firstEvent.startsAt
              .subtract(effectiveTravelDuration)
              .subtract(input.defaultBuffer),
          evidenceIds: evidenceIds,
        ),
        PlanBlock(
          id: 'depart-${firstEvent.id}',
          type: PlanBlockType.departure,
          title: 'Leave',
          startsAt: firstEvent.startsAt
              .subtract(effectiveTravelDuration)
              .subtract(input.defaultBuffer),
          endsAt: firstEvent.startsAt
              .subtract(effectiveTravelDuration)
              .subtract(input.defaultBuffer),
          evidenceIds: evidenceIds,
        ),
        PlanBlock(
          id: 'travel-${firstEvent.id}',
          type: PlanBlockType.travel,
          title: 'Travel to ${firstEvent.title}',
          startsAt: firstEvent.startsAt
              .subtract(effectiveTravelDuration)
              .subtract(input.defaultBuffer),
          endsAt: firstEvent.startsAt.subtract(input.defaultBuffer),
          evidenceIds: evidenceIds,
        ),
      ],
      for (final event in sortedEvents)
        PlanBlock(
          id: 'event-${event.id}',
          type: PlanBlockType.event,
          title: event.title,
          startsAt: event.startsAt,
          endsAt: event.endsAt,
          evidenceIds: ['evidence-event-${event.id}'],
        ),
    ];

    final planConflicts = <PlanConflict>[];
    final taskEvidence = <Evidence>[];
    final occupied = <({DateTime start, DateTime end, String id})>[
      for (final event in sortedEvents)
        (
          start: event.startsAt,
          end: event.endsAt,
          id: event.id,
        ),
      for (final block in blocks.where((block) =>
          (block.type == PlanBlockType.preparation ||
              block.type == PlanBlockType.travel) &&
          block.endsAt.isAfter(block.startsAt)))
        (
          start: block.startsAt,
          end: block.endsAt,
          id: 'schedule:${block.id}',
        ),
    ]..sort((a, b) => a.start.compareTo(b.start));
    final pendingTasks = input.tasks
        .where((task) => task.status == PlannerTaskStatus.pending)
        .toList()
      ..sort((a, b) {
        final priorityOrder = b.priority.index.compareTo(a.priority.index);
        return priorityOrder != 0
            ? priorityOrder
            : a.deadline.compareTo(b.deadline);
      });
    for (final task in pendingTasks) {
      final evidenceId = 'evidence-task-${task.id}';
      final startFloor = task.earliestStart ??
          DateTime(
            input.date.year,
            input.date.month,
            input.date.day,
          );
      var cursor = startFloor.isAfter(input.now) ? startFloor : input.now;
      final dayStart = DateTime(
        input.date.year,
        input.date.month,
        input.date.day,
        input.planningDayStartHour,
      );
      if (cursor.isBefore(dayStart)) {
        cursor = dayStart;
      }
      DateTime? slotStart;
      for (final busy in occupied) {
        if (!busy.end.isAfter(cursor)) continue;
        final candidateEnd = cursor.add(task.duration);
        if (!candidateEnd.isAfter(busy.start) &&
            !candidateEnd.isAfter(task.deadline)) {
          slotStart = cursor;
          break;
        }
        if (cursor.isBefore(busy.end)) cursor = busy.end;
        if (!cursor.isBefore(task.deadline)) break;
      }
      slotStart ??=
          cursor.add(task.duration).isAfter(task.deadline) ? null : cursor;
      taskEvidence.add(Evidence(
        id: evidenceId,
        source: EvidenceSource.userExplicit,
        summary:
            'Task “${task.title}” needs ${task.duration.inMinutes} minutes before ${task.deadline}. ${task.earliestStart == null ? 'Proposed slots start from ${input.planningDayStartHour}:00' : 'You asked not to start before ${task.earliestStart}'}. Only entered fixed events are accounted for; other commitments are unknown.',
        timestamp: input.now,
        confidence: 1,
      ));
      if (slotStart == null) {
        final affected = occupied
            .where((busy) =>
                !busy.id.startsWith('schedule:') &&
                busy.start.isBefore(task.deadline) &&
                busy.end.isAfter(startFloor))
            .map((busy) => busy.id)
            .toList();
        final conflictId = 'conflict-${task.id}';
        planConflicts.add(PlanConflict(
          id: conflictId,
          summary:
              'No available ${task.duration.inMinutes}-minute slot for ${task.title} before its deadline.',
          affectedItemIds: affected,
          deadline: task.deadline,
          evidenceIds: [
            evidenceId,
            ...affected.map((id) => 'evidence-event-$id')
          ],
        ));
        blocks.add(PlanBlock(
          id: conflictId,
          type: PlanBlockType.conflict,
          title:
              'Schedule conflict: No available ${task.duration.inMinutes}-minute slot for ${task.title} before its deadline.',
          startsAt: task.deadline,
          endsAt: task.deadline,
          evidenceIds: planConflicts.last.evidenceIds,
        ));
        continue;
      }
      final taskEnd = slotStart.add(task.duration);
      final taskBlock = PlanBlock(
        id: 'task-${task.id}',
        type: PlanBlockType.task,
        title: task.title,
        startsAt: slotStart,
        endsAt: taskEnd,
        evidenceIds: [evidenceId],
      );
      blocks.add(taskBlock);
      occupied.add((start: slotStart, end: taskEnd, id: task.id));
      occupied.sort((a, b) => a.start.compareTo(b.start));
    }
    blocks.sort((a, b) => a.startsAt.compareTo(b.startsAt));

    final weatherEvidence = input.weatherDecision == null
        ? null
        : Evidence(
            id: 'evidence-weather',
            source: EvidenceSource.retrieved,
            summary: input.weatherDecision!.explanation,
            timestamp: input.now,
            confidence: input.weatherDecision!.score,
          );

    final plan = DailyPlan(
      id: 'plan-${input.date.toIso8601String()}',
      date: input.date,
      blocks: blocks,
      evidenceIds: [
        ...evidenceIds,
        ...taskEvidence.map((item) => item.id),
      ],
      createdAt: input.now,
      updatedAt: input.now,
      conflicts: planConflicts,
    );

    return PlanningResult(
      plan: plan,
      evidence: [
        if (eventEvidence != null) eventEvidence,
        prepEvidence,
        if (travelEvidence != null) travelEvidence,
        bufferEvidence,
        if (weatherEvidence != null) weatherEvidence,
        ...taskEvidence,
      ],
    );
  }
}
