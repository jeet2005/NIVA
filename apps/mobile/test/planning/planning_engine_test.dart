import 'package:flutter_test/flutter_test.dart';
import 'package:niva_mobile/models/calendar_event.dart';
import 'package:niva_mobile/models/daily_plan.dart';
import 'package:niva_mobile/models/memory.dart';
import 'package:niva_mobile/models/planner_task.dart';
import 'package:niva_mobile/planning/planning_engine.dart';

void main() {
  test('buildDailyPlan calculates wake and departure deterministically', () {
    final now = DateTime(2026, 10, 8, 10);
    final eventStart = DateTime(2026, 10, 9, 9);
    final result = const PlanningEngine().buildDailyPlan(
      PlanningInput(
        date: DateTime(2026, 10, 9),
        events: [
          CalendarEvent(
            id: 'college',
            title: 'College',
            startsAt: eventStart,
            endsAt: eventStart.add(const Duration(hours: 6)),
          ),
        ],
        memories: const [],
        preparationDuration: const Duration(minutes: 48),
        travelDuration: const Duration(minutes: 43),
        defaultBuffer: const Duration(minutes: 12),
        now: now,
      ),
    );

    final wake = result.plan.firstBlockOfType(PlanBlockType.wake);
    final departure = result.plan.firstBlockOfType(PlanBlockType.departure);

    expect(departure!.startsAt, DateTime(2026, 10, 9, 8, 5));
    expect(wake!.startsAt, DateTime(2026, 10, 9, 7, 17));
    expect(result.evidence, isNotEmpty);
  });

  test('buildDailyPlan returns an empty plan when no events are available', () {
    final result = const PlanningEngine().buildDailyPlan(
      PlanningInput(
        date: DateTime(2026, 10, 9),
        events: const [],
        memories: const [],
        preparationDuration: const Duration(minutes: 48),
        travelDuration: const Duration(minutes: 43),
        defaultBuffer: const Duration(minutes: 12),
        now: DateTime(2026, 10, 8, 10),
      ),
    );

    expect(result.plan.blocks, isEmpty);
    expect(result.evidence, isEmpty);
  });

  test('explicit preparation correction changes calculated wake time', () {
    final now = DateTime(2026, 10, 8, 10);
    final eventStart = DateTime(2026, 10, 9, 9);
    final result = const PlanningEngine().buildDailyPlan(
      PlanningInput(
        date: DateTime(2026, 10, 9),
        events: [
          CalendarEvent(
            id: 'college',
            title: 'College',
            startsAt: eventStart,
            endsAt: eventStart.add(const Duration(hours: 6)),
          ),
        ],
        memories: [
          Memory(
            id: 'prep-correction',
            type: MemoryType.explicitPreference,
            title: 'Preparation time',
            value: '30 minutes',
            source: MemorySource.userCorrection,
            confidence: MemoryConfidence.high,
            condition: 'preparation.duration',
            createdAt: now,
            updatedAt: now,
          ),
        ],
        preparationDuration: const Duration(minutes: 30),
        travelDuration: const Duration(minutes: 43),
        defaultBuffer: const Duration(minutes: 12),
        now: now,
      ),
    );

    expect(
      result.plan.firstBlockOfType(PlanBlockType.wake)!.startsAt,
      DateTime(2026, 10, 9, 7, 35),
    );
  });

  test('does not invent commute times when no route estimate exists', () {
    final now = DateTime(2026, 10, 8, 10);
    final eventStart = DateTime(2026, 10, 9, 9);
    final result = const PlanningEngine().buildDailyPlan(
      PlanningInput(
        date: DateTime(2026, 10, 9),
        events: [
          CalendarEvent(
            id: 'meeting',
            title: 'Meeting',
            startsAt: eventStart,
            endsAt: eventStart.add(const Duration(hours: 1)),
          ),
        ],
        memories: const [],
        preparationDuration: const Duration(minutes: 30),
        travelDuration: Duration.zero,
        defaultBuffer: const Duration(minutes: 10),
        now: now,
      ),
    );

    expect(result.plan.firstBlockOfType(PlanBlockType.wake), isNull);
    expect(result.plan.firstBlockOfType(PlanBlockType.departure), isNull);
    expect(result.plan.firstBlockOfType(PlanBlockType.event), isNotNull);
    expect(
        result.evidence.any((item) => item.id == 'evidence-travel'), isFalse);
  });

  test('schedules an explicit task into a free slot before its deadline', () {
    final now = DateTime(2026, 10, 8, 8);
    final eventStart = DateTime(2026, 10, 8, 10);
    final task = PlannerTask(
      id: 'study',
      title: 'Study biology',
      duration: const Duration(hours: 1),
      deadline: DateTime(2026, 10, 8, 12),
      priority: PlannerTaskPriority.high,
      status: PlannerTaskStatus.pending,
      createdAt: now,
      updatedAt: now,
    );
    final result = const PlanningEngine().buildDailyPlan(
      PlanningInput(
        date: DateTime(2026, 10, 8),
        events: [
          CalendarEvent(
            id: 'lecture',
            title: 'Lecture',
            startsAt: eventStart,
            endsAt: eventStart.add(const Duration(hours: 1)),
          ),
        ],
        tasks: [task],
        memories: const [],
        preparationDuration: Duration.zero,
        travelDuration: Duration.zero,
        defaultBuffer: Duration.zero,
        now: now,
      ),
    );

    final scheduled =
        result.plan.blocks.singleWhere((block) => block.id == 'task-study');
    expect(scheduled.startsAt, DateTime(2026, 10, 8, 9));
    expect(scheduled.endsAt, DateTime(2026, 10, 8, 10));
    expect(result.plan.conflicts, isEmpty);
    expect(result.evidence.any((item) => item.id == 'evidence-task-study'),
        isTrue);
  });

  test('reports a task deadline conflict instead of scheduling over an event',
      () {
    final now = DateTime(2026, 10, 8, 8);
    final eventStart = now;
    final task = PlannerTask(
      id: 'assignment',
      title: 'Finish assignment',
      duration: const Duration(hours: 1),
      deadline: DateTime(2026, 10, 8, 10, 30),
      priority: PlannerTaskPriority.urgent,
      status: PlannerTaskStatus.pending,
      createdAt: now,
      updatedAt: now,
    );
    final result = const PlanningEngine().buildDailyPlan(
      PlanningInput(
        date: DateTime(2026, 10, 8),
        events: [
          CalendarEvent(
            id: 'lab',
            title: 'Lab',
            startsAt: eventStart,
            endsAt: DateTime(2026, 10, 8, 10),
          ),
        ],
        tasks: [task],
        memories: const [],
        preparationDuration: Duration.zero,
        travelDuration: Duration.zero,
        defaultBuffer: Duration.zero,
        now: now,
      ),
    );

    expect(result.plan.blocks.any((block) => block.id == 'task-assignment'),
        isFalse);
    expect(
        result.plan.blocks.any((block) => block.type == PlanBlockType.conflict),
        isTrue);
    expect(result.plan.conflicts.single.affectedItemIds, contains('lab'));
  });
}
