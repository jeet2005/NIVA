import '../models/alarm.dart';
import '../models/daily_plan.dart';
import '../models/evidence.dart';

class AdaptiveAlarmService {
  const AdaptiveAlarmService();

  AdaptiveAlarm? alarmForPlan(
    DailyPlan plan, {
    List<Evidence> evidence = const [],
  }) {
    final wake = plan.firstBlockOfType(PlanBlockType.wake);
    if (wake == null) {
      return null;
    }

    return AdaptiveAlarm(
      id: 'alarm-${plan.id}',
      scheduledFor: wake.startsAt,
      reason: _reasonForPlan(plan, wake, evidence: evidence),
      evidenceIds: wake.evidenceIds,
      calculationVersion: 1,
      isActive: true,
    );
  }

  String reasonForPlan(DailyPlan plan, List<Evidence> evidence) {
    final wake = plan.firstBlockOfType(PlanBlockType.wake);
    if (wake == null) {
      return 'No alarm: the plan has no evidence-backed wake time.';
    }
    return _reasonForPlan(plan, wake, evidence: evidence);
  }

  String _reasonForPlan(
    DailyPlan plan,
    PlanBlock wake, {
    required List<Evidence> evidence,
  }) {
    final parts = evidence
        .where((item) => wake.evidenceIds.contains(item.id))
        .map((item) => item.summary)
        .toList();
    if (parts.isEmpty) {
      final preparation = plan.firstBlockOfType(PlanBlockType.preparation);
      final event = plan.blocks.firstWhere(
        (block) => block.type == PlanBlockType.event,
        orElse: () => wake,
      );
      if (preparation != null) {
        parts.add(
            'Preparation: ${preparation.endsAt.difference(preparation.startsAt).inMinutes} min');
      }
      if (event.type == PlanBlockType.event) {
        parts.add('${event.title}: ${event.startsAt}');
      }
      if (plan.firstBlockOfType(PlanBlockType.travel) != null) {
        final travel = plan.firstBlockOfType(PlanBlockType.travel)!;
        parts.add(
            'Travel: ${travel.endsAt.difference(travel.startsAt).inMinutes} min');
      }
    }
    return parts.isEmpty
        ? 'Wake time ${wake.startsAt} calculated from available plan evidence.'
        : 'Wake time ${wake.startsAt} calculated from ${parts.join('; ')}.';
  }
}
