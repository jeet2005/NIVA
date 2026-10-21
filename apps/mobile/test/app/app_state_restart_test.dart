import 'package:flutter_test/flutter_test.dart';
import 'package:niva_mobile/app/app_state.dart';
import 'package:niva_mobile/models/user_profile.dart';
import 'package:niva_mobile/models/planner_task.dart';
import 'package:niva_mobile/storage/in_memory_local_store.dart';

void main() {
  test('restores a manual-event plan and its evidence after controller restart',
      () async {
    final store = InMemoryLocalStore();
    final first = AppStateController(store);
    await _waitUntilLoaded(first);
    await first.completeOnboarding(
      displayName: 'Sam',
      tone: PreferredTone.warm,
      notificationLevel: NotificationLevel.balanced,
    );
    await first.recordRouteObservation(
      durationMinutes: 43,
      transport: 'walking',
    );
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    final startsAt = DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 9);
    await first.addManualEvent(
      title: 'Appointment',
      startsAt: startsAt,
      endsAt: startsAt.add(const Duration(hours: 1)),
    );

    expect(first.state.currentPlan, isNotNull);
    first.dispose();

    final restarted = AppStateController(store);
    await _waitUntilLoaded(restarted);
    expect(restarted.state.events.single.title, 'Appointment');
    expect(restarted.state.currentPlan, isNotNull);
    expect(
      restarted.state.currentEvidence.map((evidence) => evidence.summary),
      contains('Appointment starts at $startsAt'),
    );
    expect(
      restarted.state.currentEvidence.any(
        (evidence) => evidence.summary.contains('Travel duration 43 min'),
      ),
      isTrue,
    );
    restarted.dispose();
  });

  test('plans a task, restores it, and removes it from planning when completed',
      () async {
    final store = InMemoryLocalStore();
    final first = AppStateController(store);
    await _waitUntilLoaded(first);
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    final deadline = DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 18);
    await first.addTask(
      title: 'Study biology',
      duration: const Duration(minutes: 45),
      deadline: deadline,
      priority: PlannerTaskPriority.high,
    );
    final taskId = first.state.tasks.single.id;
    expect(
        first.state.currentPlan!.blocks
            .any((block) => block.id == 'task-$taskId'),
        isTrue);
    first.dispose();

    final restarted = AppStateController(store);
    await _waitUntilLoaded(restarted);
    expect(restarted.state.tasks.single.title, 'Study biology');
    expect(
      restarted.state.currentEvidence
          .any((item) => item.id == 'evidence-task-$taskId'),
      isTrue,
    );
    final requestedStart =
        DateTime(deadline.year, deadline.month, deadline.day, 14);
    await restarted.rescheduleTask(taskId, requestedStart);
    expect(
      restarted.state.currentPlan!.blocks
          .singleWhere((block) => block.id == 'task-$taskId')
          .startsAt,
      requestedStart,
    );
    expect(
      restarted.state.currentEvidence
          .singleWhere((item) => item.id == 'evidence-task-$taskId')
          .summary,
      contains('You asked not to start before'),
    );
    await restarted.setTaskStatus(taskId, PlannerTaskStatus.completed);
    expect(
        restarted.state.currentPlan!.blocks
            .any((block) => block.id == 'task-$taskId'),
        isFalse);
    restarted.dispose();
  });
}

Future<void> _waitUntilLoaded(AppStateController controller) async {
  for (var attempt = 0; attempt < 20 && !controller.state.isLoaded; attempt++) {
    await Future<void>.delayed(Duration.zero);
  }
  expect(controller.state.isLoaded, isTrue);
}
