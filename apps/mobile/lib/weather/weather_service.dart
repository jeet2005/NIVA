import '../models/weather.dart';

abstract interface class WeatherService {
  Future<List<WeatherEvent>> hourlyForecast(DateTime from, DateTime through);
}

class SimulatedWeatherService implements WeatherService {
  const SimulatedWeatherService(this.events);

  final List<WeatherEvent> events;

  @override
  Future<List<WeatherEvent>> hourlyForecast(
    DateTime from,
    DateTime through,
  ) async {
    return events
        .where((event) => event.startsAt.isBefore(through))
        .where((event) => event.endsAt.isAfter(from))
        .toList();
  }
}
