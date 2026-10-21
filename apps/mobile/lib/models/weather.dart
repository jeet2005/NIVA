enum WeatherCondition { clear, rain, storm, extreme, unknown }

class WeatherEvent {
  const WeatherEvent({
    required this.id,
    required this.condition,
    required this.startsAt,
    required this.endsAt,
    required this.probability,
    required this.severity,
    required this.source,
    required this.fetchedAt,
  });

  final String id;
  final WeatherCondition condition;
  final DateTime startsAt;
  final DateTime endsAt;
  final double probability;
  final int severity;
  final String source;
  final DateTime fetchedAt;

  bool overlaps(DateTime start, DateTime end) =>
      startsAt.isBefore(end) && endsAt.isAfter(start);

  bool get isRainLike =>
      condition == WeatherCondition.rain ||
      condition == WeatherCondition.storm ||
      condition == WeatherCondition.extreme;
}
