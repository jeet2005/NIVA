import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_state.dart';
import '../../models/daily_plan.dart';
import '../../models/user_profile.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStateProvider);
    if (!state.isLoaded) {
      return const Center(child: CircularProgressIndicator());
    }
    if (!state.hasCompletedOnboarding) {
      return const _OnboardingView();
    }
    final plan = state.currentPlan;
    final nextEvent = state.events.isEmpty ? null : state.events.first;
    final wake = plan?.firstBlockOfType(PlanBlockType.wake);
    final leave = plan?.firstBlockOfType(PlanBlockType.departure);
    final route = state.routeEstimate;
    final weatherDecision = state.contextSnapshot.weatherEvents.isEmpty
        ? 'Weather unavailable'
        : '${state.contextSnapshot.weatherEvents.first.condition.name} forecast';

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        if (state.startupError != null)
          MaterialBanner(
            content: Text(state.startupError!),
            actions: [
              TextButton(
                onPressed: () =>
                    ref.read(appStateProvider.notifier).dismissStartupError(),
                child: const Text('Dismiss'),
              ),
            ],
          ),
        Text(
          'Good day, ${state.profile.displayName}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 20),
        Text('Next', style: Theme.of(context).textTheme.titleMedium),
        Text(nextEvent == null
            ? 'No upcoming events available'
            : nextEvent.title),
        const SizedBox(height: 24),
        Text("NIVA's plan", style: Theme.of(context).textTheme.titleMedium),
        Text(
          wake == null ? 'Wake - not planned yet' : 'Wake - ${wake.startsAt}',
        ),
        Text(
          leave == null
              ? 'Leave - not planned yet'
              : 'Leave - ${leave.startsAt}',
        ),
        Text(route.source == 'unavailable'
            ? 'Route - no estimate available'
            : 'Typical route - ${route.duration.inMinutes} min (local estimate)'),
        Text('Weather - $weatherDecision'),
        if (state.currentAlarm != null)
          Text('Alarm - ${state.currentAlarm!.scheduledFor}'),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: () => ref
              .read(appStateProvider.notifier)
              .sendMessage('Plan my tomorrow.'),
          child: const Text('Plan my tomorrow'),
        ),
        const SizedBox(height: 12),
        const Text('No urgent changes based on the context available.'),
      ],
    );
  }
}

class _OnboardingView extends ConsumerStatefulWidget {
  const _OnboardingView();

  @override
  ConsumerState<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends ConsumerState<_OnboardingView> {
  final _nameController = TextEditingController();
  PreferredTone _tone = PreferredTone.warm;
  NotificationLevel _notificationLevel = NotificationLevel.balanced;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('Welcome to NIVA',
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        const Text(
          'NIVA prepares a local plan from context you provide, then explains what it used. Optional connections can be enabled later. You control your data, and NIVA will not claim live calendar, weather, or location access until those services are connected.',
        ),
        const SizedBox(height: 24),
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        SegmentedButton<PreferredTone>(
          segments: const [
            ButtonSegment(value: PreferredTone.warm, label: Text('Warm')),
            ButtonSegment(value: PreferredTone.concise, label: Text('Concise')),
            ButtonSegment(value: PreferredTone.direct, label: Text('Direct')),
          ],
          selected: {_tone},
          onSelectionChanged: (selection) {
            setState(() => _tone = selection.single);
          },
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<NotificationLevel>(
          initialValue: _notificationLevel,
          decoration: const InputDecoration(
            labelText: 'Notification level',
            border: OutlineInputBorder(),
          ),
          items: const [
            DropdownMenuItem(
              value: NotificationLevel.minimal,
              child: Text('Minimal'),
            ),
            DropdownMenuItem(
              value: NotificationLevel.balanced,
              child: Text('Balanced'),
            ),
            DropdownMenuItem(
              value: NotificationLevel.proactive,
              child: Text('Proactive'),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              setState(() => _notificationLevel = value);
            }
          },
        ),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: () {
            ref.read(appStateProvider.notifier).completeOnboarding(
                  displayName: _nameController.text,
                  tone: _tone,
                  notificationLevel: _notificationLevel,
                );
          },
          child: const Text('Continue'),
        ),
      ],
    );
  }
}
