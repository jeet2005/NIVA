enum NivaNotificationPriority { critical, important, useful, informational }

class NivaNotification {
  const NivaNotification({
    required this.id,
    required this.fingerprint,
    required this.priority,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.evidenceIds,
  });

  final String id;
  final String fingerprint;
  final NivaNotificationPriority priority;
  final String title;
  final String body;
  final DateTime createdAt;
  final List<String> evidenceIds;
}
