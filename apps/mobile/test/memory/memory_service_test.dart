import 'package:flutter_test/flutter_test.dart';
import 'package:niva_mobile/memory/memory_service.dart';
import 'package:niva_mobile/models/memory.dart';

void main() {
  test('explicit preference outranks observed pattern', () {
    final now = DateTime(2026, 10, 8, 10);
    final observed = Memory(
      id: 'observed',
      type: MemoryType.observedPattern,
      title: 'Transport',
      value: 'walk',
      source: MemorySource.observedBehavior,
      confidence: MemoryConfidence.medium,
      condition: 'weather.rain.transport',
      createdAt: now,
      updatedAt: now,
    );
    final explicit = Memory(
      id: 'explicit',
      type: MemoryType.explicitPreference,
      title: 'Rain transport',
      value: 'car',
      source: MemorySource.explicitUserStatement,
      confidence: MemoryConfidence.high,
      condition: 'weather.rain.transport',
      createdAt: now,
      updatedAt: now,
    );

    final selected = const MemoryService().highestPriorityMemory(
      [observed, explicit],
      condition: 'weather.rain.transport',
      now: now,
    );

    expect(selected!.value, 'car');
  });

  test('expired temporary context is ignored', () {
    final now = DateTime(2026, 10, 8, 10);
    final memory = Memory(
      id: 'temporary',
      type: MemoryType.temporaryContext,
      title: 'Tomorrow transport',
      value: 'metro',
      source: MemorySource.explicitUserStatement,
      confidence: MemoryConfidence.high,
      condition: 'transport.tomorrow',
      expiresAt: now.subtract(const Duration(hours: 1)),
      createdAt: now.subtract(const Duration(days: 2)),
      updatedAt: now.subtract(const Duration(days: 2)),
    );

    final selected = const MemoryService().highestPriorityMemory(
      [memory],
      condition: 'transport.tomorrow',
      now: now,
    );

    expect(selected, isNull);
  });
}
