import 'package:flutter_test/flutter_test.dart';
import 'package:niva_mobile/models/route_profile.dart';
import 'package:niva_mobile/routing/route_memory_service.dart';

void main() {
  test('creates route profile from observations', () {
    final now = DateTime(2026, 10, 8, 8);
    final profile = const RouteMemoryService().createOrUpdateProfile(
      id: 'home-campus',
      originCluster: 'home',
      destinationCluster: 'campus',
      transport: 'walking',
      now: now,
      observations: [
        RouteObservation(
          id: 'one',
          routeProfileId: 'home-campus',
          duration: const Duration(minutes: 39),
          transport: 'walking',
          observedAt: now.subtract(const Duration(days: 2)),
          source: 'observed',
        ),
        RouteObservation(
          id: 'two',
          routeProfileId: 'home-campus',
          duration: const Duration(minutes: 43),
          transport: 'walking',
          observedAt: now.subtract(const Duration(days: 1)),
          source: 'observed',
        ),
        RouteObservation(
          id: 'three',
          routeProfileId: 'home-campus',
          duration: const Duration(minutes: 47),
          transport: 'walking',
          observedAt: now,
          source: 'observed',
        ),
      ],
    );

    expect(profile.typicalDuration, const Duration(minutes: 43));
    expect(profile.sampleCount, 3);
    expect(profile.variance, greaterThan(0));
  });

  test('calculates route delay from estimate', () {
    final delay = const RouteMemoryService().delay(
      RouteEstimate(
        routeProfileId: 'home-campus',
        duration: const Duration(minutes: 62),
        normalDuration: const Duration(minutes: 43),
        source: 'test',
        fetchedAt: DateTime(2026, 10, 8),
      ),
    );

    expect(delay, const Duration(minutes: 19));
  });

  test('returns no learned travel time without observations', () {
    final profile = const RouteMemoryService().createOrUpdateProfile(
      id: 'home-campus',
      originCluster: 'home',
      destinationCluster: 'campus',
      transport: 'walking',
      observations: const [],
      now: DateTime(2026, 10, 8, 8),
    );

    expect(profile.sampleCount, 0);
    expect(profile.typicalDuration, Duration.zero);
  });
}
