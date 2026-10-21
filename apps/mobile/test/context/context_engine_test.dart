import 'package:flutter_test/flutter_test.dart';
import 'package:niva_mobile/context/context_engine.dart';
import 'package:niva_mobile/context/relevance_engine.dart';
import 'package:niva_mobile/models/context_snapshot.dart';
import 'package:niva_mobile/models/memory.dart';
import 'package:niva_mobile/models/relevance.dart';

void main() {
  test('normalizes source and freshness while excluding expired memories', () {
    final now = DateTime(2026, 10, 20, 9);
    final snapshot = const ContextEngine().buildSnapshot(
      now: now,
      upcomingEvents: const [],
      memories: [
        Memory(
            id: 'pref',
            type: MemoryType.explicitPreference,
            title: 'Tone',
            value: 'concise',
            source: MemorySource.explicitUserStatement,
            confidence: MemoryConfidence.high,
            createdAt: now,
            updatedAt: now),
        Memory(
            id: 'expired',
            type: MemoryType.temporaryContext,
            title: 'Temp',
            value: 'gone',
            source: MemorySource.explicitUserStatement,
            confidence: MemoryConfidence.high,
            createdAt: now.subtract(const Duration(days: 2)),
            updatedAt: now.subtract(const Duration(days: 2)),
            expiresAt: now.subtract(const Duration(days: 1))),
      ],
      weatherEvents: const [],
      routeEstimate: null,
      activity: ActivityState.stationary,
      activityConfidence: 1,
      activityTimestamp: now,
    );

    expect(snapshot.items.map((item) => item.id), contains('memory:pref'));
    expect(snapshot.items.map((item) => item.id),
        isNot(contains('memory:expired')));
    expect(
        snapshot.items.singleWhere((item) => item.id == 'memory:pref').source,
        'explicitUserStatement');
    expect(snapshot.unknowns, contains('No weather source is connected.'));
  });

  test('generic relevance requires current evidence and deduplicates by domain',
      () {
    final now = DateTime(2026, 10, 20, 9);
    const engine = RelevanceEngine();
    final snapshot = ContextSnapshot(
      createdAt: now,
      upcomingEvents: const [],
      memories: const [],
      weatherEvents: const [],
      routeEstimate: null,
      activity: ActivityState.unknown,
      activityConfidence: 0,
      activityTimestamp: now,
      items: [
        ContextItem(
            id: 'fact:a',
            kind: ContextKind.task,
            summary: 'Deadline tomorrow',
            source: 'local_task',
            observedAt: now,
            freshness: ContextFreshness.current,
            confidence: 1)
      ],
    );
    final candidate = ContextCandidate(
        id: 'c1',
        domain: 'deadline',
        summary: 'Due soon',
        createdAt: now,
        evidenceIds: const ['fact:a'],
        priority: 0.9);
    expect(engine.evaluateCandidate(snapshot, candidate).action,
        RecommendedAction.notify);
    final duplicate = ContextCandidate(
        id: 'c2',
        domain: 'deadline',
        summary: 'Due soon',
        createdAt: now.add(const Duration(hours: 1)),
        evidenceIds: const ['fact:a'],
        priority: 0.9);
    expect(
        engine.evaluateCandidate(snapshot, duplicate,
            existing: [candidate]).action,
        RecommendedAction.ignore);
    final withoutEvidence = ContextCandidate(
        id: 'c3',
        domain: 'other',
        summary: 'Needs context',
        createdAt: now,
        evidenceIds: const ['missing']);
    expect(engine.evaluateCandidate(snapshot, withoutEvidence).action,
        RecommendedAction.ask);
    final expired = ContextCandidate(
      id: 'c4',
      domain: 'deadline',
      summary: 'Already expired',
      createdAt: now.subtract(const Duration(days: 1)),
      expiresAt: now,
      evidenceIds: const ['fact:a'],
    );
    expect(engine.evaluateCandidate(snapshot, expired).action,
        RecommendedAction.ignore);
  });

  test('surfaces conflicting active memory values without choosing one', () {
    final now = DateTime(2026, 10, 20, 9);
    Memory memory(String id, String value) => Memory(
          id: id,
          type: MemoryType.explicitPreference,
          title: 'Travel preference',
          value: value,
          condition: 'transport.default',
          source: MemorySource.explicitUserStatement,
          confidence: MemoryConfidence.high,
          createdAt: now,
          updatedAt: now,
        );
    final snapshot = const ContextEngine().buildSnapshot(
      now: now,
      upcomingEvents: const [],
      memories: [memory('walk', 'walk'), memory('bus', 'bus')],
      weatherEvents: const [],
      routeEstimate: null,
      activity: ActivityState.stationary,
      activityConfidence: 1,
      activityTimestamp: now,
    );
    expect(snapshot.contradictions, hasLength(1));
    expect(snapshot.memories, hasLength(2));
  });
}
