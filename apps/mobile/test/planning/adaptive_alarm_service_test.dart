import 'package:flutter_test/flutter_test.dart';
import 'package:niva_mobile/models/daily_plan.dart';
import 'package:niva_mobile/planning/adaptive_alarm_service.dart';

void main() {
  test('creates an alarm from the wake block', () {
    final wakeTime = DateTime(2026, 10, 9, 7, 17);
    final plan = DailyPlan(
      id: 'plan',
      date: DateTime(2026, 10, 9),
      blocks: [
        PlanBlock(
          id: 'wake',
          type: PlanBlockType.wake,
          title: 'Wake',
          startsAt: wakeTime,
          endsAt: wakeTime,
          evidenceIds: const ['event', 'travel'],
        ),
      ],
      evidenceIds: const ['event', 'travel'],
      createdAt: DateTime(2026, 10, 8),
      updatedAt: DateTime(2026, 10, 8),
    );

    final alarm = const AdaptiveAlarmService().alarmForPlan(plan);

    expect(alarm!.scheduledFor, wakeTime);
    expect(alarm.evidenceIds, contains('travel'));
    expect(alarm.isActive, isTrue);
  });
}
