class CalendarEvent {
  const CalendarEvent({
    required this.id,
    required this.title,
    required this.startsAt,
    required this.endsAt,
    this.locationName,
  });

  final String id;
  final String title;
  final DateTime startsAt;
  final DateTime endsAt;
  final String? locationName;
}
