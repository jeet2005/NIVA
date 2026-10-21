import '../memory/memory_service.dart';
import '../models/memory.dart';
import '../planning/planning_engine.dart';

class MockAgentResponse {
  const MockAgentResponse({
    required this.message,
    this.planResult,
    this.createdMemory,
  });

  final String message;
  final PlanningResult? planResult;
  final Memory? createdMemory;
}

class MockAgent {
  const MockAgent({
    required this.planningEngine,
    required this.memoryService,
  });

  final PlanningEngine planningEngine;
  final MemoryService memoryService;

  MockAgentResponse respond({
    required String text,
    required PlanningInput planningInput,
  }) {
    final normalized = text.toLowerCase();
    if (normalized.contains('plan my tomorrow')) {
      final result = planningEngine.buildDailyPlan(planningInput);
      if (planningInput.events.isEmpty) {
        return const MockAgentResponse(
          message:
              "I don't have any events for tomorrow yet. Add an event in Today and I can plan around it.",
          planResult: null,
        );
      }
      return MockAgentResponse(
        message:
            "Sure. I found ${planningInput.events.length} event(s) and built a deterministic plan around them.",
        planResult: result,
      );
    }

    if (normalized.contains('taking the car')) {
      final now = planningInput.now;
      final memory = Memory(
        id: 'temporary-transport-${now.microsecondsSinceEpoch}',
        type: MemoryType.temporaryContext,
        title: 'Transport for tomorrow',
        value: 'car',
        source: MemorySource.explicitUserStatement,
        confidence: MemoryConfidence.high,
        condition: 'transport.tomorrow',
        expiresAt: DateTime(now.year, now.month, now.day + 2),
        createdAt: now,
        updatedAt: now,
      );
      return MockAgentResponse(
        message: "Got it. I'll use the car for tomorrow's plan.",
        createdMemory: memory,
      );
    }

    final preparationCorrection = RegExp(
      r'(?:only need|need|takes?|take)\s+(\d+)\s*(?:minutes?|mins?)',
    ).firstMatch(normalized);
    if (preparationCorrection != null &&
        (normalized.contains('ready') ||
            normalized.contains('prepar') ||
            normalized.contains('only need'))) {
      final minutes = preparationCorrection.group(1)!;
      final memory = memoryService.recordCorrection(
        id: 'correction-preparation-${planningInput.now.microsecondsSinceEpoch}',
        title: 'Preparation time',
        value: '$minutes minutes',
        condition: 'preparation.duration',
        now: planningInput.now,
      );
      return MockAgentResponse(
        message:
            "Got it. I'll use $minutes minutes for future preparation plans.",
        createdMemory: memory,
      );
    }

    return const MockAgentResponse(
      message:
          "I can help with local planning, memories, and explanations. I don't have live integrations connected yet.",
    );
  }
}
