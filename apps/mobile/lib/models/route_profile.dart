class RouteProfile {
  const RouteProfile({
    required this.id,
    required this.originCluster,
    required this.destinationCluster,
    required this.typicalTransport,
    required this.typicalDuration,
    required this.variance,
    required this.dayOfWeek,
    required this.timeWindowLabel,
    required this.sampleCount,
    required this.lastUpdated,
  });

  final String id;
  final String originCluster;
  final String destinationCluster;
  final String typicalTransport;
  final Duration typicalDuration;
  final double variance;
  final int dayOfWeek;
  final String timeWindowLabel;
  final int sampleCount;
  final DateTime lastUpdated;
}

class RouteObservation {
  const RouteObservation({
    required this.id,
    required this.routeProfileId,
    required this.duration,
    required this.transport,
    required this.observedAt,
    required this.source,
  });

  final String id;
  final String routeProfileId;
  final Duration duration;
  final String transport;
  final DateTime observedAt;
  final String source;
}

class RouteEstimate {
  const RouteEstimate({
    required this.routeProfileId,
    required this.duration,
    required this.normalDuration,
    required this.source,
    required this.fetchedAt,
  });

  final String routeProfileId;
  final Duration duration;
  final Duration normalDuration;
  final String source;
  final DateTime fetchedAt;

  Duration get delay => duration - normalDuration;
}
