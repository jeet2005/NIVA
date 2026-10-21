import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_state.dart';
import '../../models/daily_plan.dart';

class PlanScreen extends ConsumerWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plan = ref.watch(appStateProvider).currentPlan;
    if (plan == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('No plan yet. Plans use events you add or connect.'),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: () => ref
                    .read(appStateProvider.notifier)
                    .sendMessage('Plan my tomorrow.'),
                icon: const Icon(Icons.auto_awesome_outlined),
                label: const Text('Build a plan'),
              ),
            ],
          ),
        ),
      );
    }
    final alarm = ref.watch(appStateProvider).currentAlarm;
    final evidence = ref.watch(appStateProvider).currentEvidence;
    final wake = plan.firstBlockOfType(PlanBlockType.wake);
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: plan.blocks.length + (alarm == null ? 0 : 1) + 1,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        if (alarm != null && index == 0) {
          return ListTile(
            leading: const Icon(Icons.alarm),
            title: const Text('Adaptive alarm'),
            subtitle: Text('${alarm.scheduledFor}\n${alarm.reason}'),
            isThreeLine: true,
            trailing: IconButton(
              tooltip: 'Cancel alarm',
              icon: const Icon(Icons.alarm_off_outlined),
              onPressed: () =>
                  ref.read(appStateProvider.notifier).cancelAlarm(),
            ),
          );
        }
        final blockIndex = alarm == null ? index : index - 1;
        if (blockIndex >= plan.blocks.length) {
          return ExpansionTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Why this plan?'),
            children: [
              if (wake != null)
                ListTile(
                  dense: true,
                  title: Text('Wake time: ${wake.startsAt}'),
                ),
              if (evidence.isEmpty)
                const ListTile(
                    dense: true,
                    title: Text(
                        'Evidence details are unavailable for this saved plan.')),
              for (final item in evidence)
                ListTile(
                  dense: true,
                  title: Text(item.summary),
                  subtitle: Text('${item.source.name} • ${item.timestamp}'),
                ),
            ],
          );
        }
        final block = plan.blocks[blockIndex];
        return ListTile(
          leading: Icon(block.type == PlanBlockType.conflict
              ? Icons.warning_amber_outlined
              : Icons.schedule),
          title: Text(block.title),
          subtitle: Text(block.type == PlanBlockType.conflict
              ? 'Deadline ${block.startsAt}'
              : '${block.startsAt} - ${block.endsAt}'),
        );
      },
    );
  }
}
