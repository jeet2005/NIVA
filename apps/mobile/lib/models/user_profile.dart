import '../core/time/time_window.dart';

enum PreferredTone { warm, concise, direct }

enum NotificationLevel { minimal, balanced, proactive }

class UserProfile {
  const UserProfile({
    required this.id,
    required this.displayName,
    required this.timezone,
    required this.locale,
    required this.preferredTone,
    required this.preferredNotificationLevel,
    required this.defaultTravelBuffer,
    required this.typicalSleepWindow,
    required this.typicalWakeWindow,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String displayName;
  final String timezone;
  final String locale;
  final PreferredTone preferredTone;
  final NotificationLevel preferredNotificationLevel;
  final Duration defaultTravelBuffer;
  final TimeWindow typicalSleepWindow;
  final TimeWindow typicalWakeWindow;
  final DateTime createdAt;
  final DateTime updatedAt;
}
