import '../models/niva_notification.dart';

class NotificationDecision {
  const NotificationDecision.send(this.notification) : shouldSend = true;

  const NotificationDecision.suppress()
      : shouldSend = false,
        notification = null;

  final bool shouldSend;
  final NivaNotification? notification;
}

class NotificationIntelligence {
  const NotificationIntelligence({
    this.cooldown = const Duration(minutes: 30),
  });

  final Duration cooldown;

  NotificationDecision evaluate({
    required NivaNotification candidate,
    required List<NivaNotification> history,
  }) {
    final duplicates = history.where(
      (notification) => notification.fingerprint == candidate.fingerprint,
    );
    for (final previous in duplicates) {
      final withinCooldown =
          candidate.createdAt.difference(previous.createdAt) < cooldown;
      final sameOrLowerPriority =
          candidate.priority.index >= previous.priority.index;
      if (withinCooldown && sameOrLowerPriority) {
        return const NotificationDecision.suppress();
      }
    }

    if (candidate.priority == NivaNotificationPriority.informational) {
      return const NotificationDecision.suppress();
    }

    return NotificationDecision.send(candidate);
  }
}
