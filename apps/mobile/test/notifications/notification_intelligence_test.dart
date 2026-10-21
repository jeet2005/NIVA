import 'package:flutter_test/flutter_test.dart';
import 'package:niva_mobile/models/niva_notification.dart';
import 'package:niva_mobile/notifications/notification_intelligence.dart';

void main() {
  test('suppresses duplicate notification within cooldown', () {
    final now = DateTime(2026, 10, 8, 8);
    final previous = NivaNotification(
      id: 'previous',
      fingerprint: 'traffic-heavy-college',
      priority: NivaNotificationPriority.important,
      title: 'Traffic is heavier than usual',
      body: 'Leave earlier.',
      createdAt: now,
      evidenceIds: const ['traffic'],
    );
    final candidate = NivaNotification(
      id: 'candidate',
      fingerprint: 'traffic-heavy-college',
      priority: NivaNotificationPriority.important,
      title: 'Traffic is still heavy',
      body: 'Leave earlier.',
      createdAt: now.add(const Duration(minutes: 5)),
      evidenceIds: const ['traffic'],
    );

    final decision = const NotificationIntelligence().evaluate(
      candidate: candidate,
      history: [previous],
    );

    expect(decision.shouldSend, isFalse);
  });

  test('suppresses informational notifications by default', () {
    final candidate = NivaNotification(
      id: 'weather',
      fingerprint: 'general-weather',
      priority: NivaNotificationPriority.informational,
      title: 'Weather update',
      body: 'It may rain.',
      createdAt: DateTime(2026, 10, 8, 8),
      evidenceIds: const ['weather'],
    );

    final decision = const NotificationIntelligence().evaluate(
      candidate: candidate,
      history: const [],
    );

    expect(decision.shouldSend, isFalse);
  });
}
