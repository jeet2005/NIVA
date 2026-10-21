import '../models/calendar_event.dart';

abstract interface class CalendarService {
  Future<List<CalendarEvent>> upcomingEvents(DateTime from, DateTime through);
}

class ManualCalendarService implements CalendarService {
  const ManualCalendarService(this.events);

  final List<CalendarEvent> events;

  @override
  Future<List<CalendarEvent>> upcomingEvents(
    DateTime from,
    DateTime through,
  ) async {
    return events
        .where((event) => event.startsAt.isBefore(through))
        .where((event) => event.endsAt.isAfter(from))
        .toList()
      ..sort((a, b) => a.startsAt.compareTo(b.startsAt));
  }
}
