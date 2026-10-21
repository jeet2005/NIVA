import '../models/route_profile.dart';

class RouteMemoryService {
  const RouteMemoryService();

  RouteProfile createOrUpdateProfile({
    required String id,
    required String originCluster,
    required String destinationCluster,
    required String transport,
    required List<RouteObservation> observations,
    required DateTime now,
  }) {
    if (observations.isEmpty) {
      return RouteProfile(
        id: id,
        originCluster: originCluster,
        destinationCluster: destinationCluster,
        typicalTransport: transport,
        typicalDuration: Duration.zero,
        variance: 0,
        dayOfWeek: now.weekday,
        timeWindowLabel: _timeWindowLabel(now),
        sampleCount: 0,
        lastUpdated: now,
      );
    }

    final minutes = observations
        .map((observation) => observation.duration.inMinutes.toDouble())
        .toList();
    final mean = minutes.reduce((a, b) => a + b) / minutes.length;
    final variance = minutes
            .map((value) => (value - mean) * (value - mean))
            .reduce((a, b) => a + b) /
        minutes.length;

    return RouteProfile(
      id: id,
      originCluster: originCluster,
      destinationCluster: destinationCluster,
      typicalTransport: transport,
      typicalDuration: Duration(minutes: mean.round()),
      variance: variance,
      dayOfWeek: now.weekday,
      timeWindowLabel: _timeWindowLabel(now),
      sampleCount: observations.length,
      lastUpdated: now,
    );
  }

  Duration delay(RouteEstimate estimate) => estimate.delay;

  String _timeWindowLabel(DateTime time) {
    if (time.hour < 11) {
      return 'morning';
    }
    if (time.hour < 16) {
      return 'afternoon';
    }
    if (time.hour < 21) {
      return 'evening';
    }
    return 'night';
  }
}
