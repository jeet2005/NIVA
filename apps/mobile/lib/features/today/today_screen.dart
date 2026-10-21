import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_state.dart';
import '../../models/planner_task.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(appStateProvider).events;
    final state = ref.watch(appStateProvider);
    final tasks = state.tasks;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tasks', style: Theme.of(context).textTheme.titleMedium),
            TextButton.icon(
              onPressed: () => _addTask(context, ref),
              icon: const Icon(Icons.add_task),
              label: const Text('Add task'),
            ),
          ],
        ),
        if (tasks.isEmpty)
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child:
                Text('No tasks yet. Add a task with a duration and deadline.'),
          ),
        for (final task in tasks)
          CheckboxListTile(
            value: task.status == PlannerTaskStatus.completed,
            onChanged: (complete) => ref
                .read(appStateProvider.notifier)
                .setTaskStatus(
                    task.id,
                    complete == true
                        ? PlannerTaskStatus.completed
                        : PlannerTaskStatus.pending),
            title: Text(task.title),
            subtitle: Text(
                '${task.duration.inMinutes} min • due ${task.deadline} • ${task.priority.name}${task.earliestStart == null ? '' : ' • not before ${task.earliestStart}'}'),
            controlAffinity: ListTileControlAffinity.leading,
            secondary: IconButton(
              tooltip: 'Choose a not-before time',
              icon: const Icon(Icons.edit_calendar_outlined),
              onPressed: task.status == PlannerTaskStatus.pending &&
                      task.deadline.isAfter(DateTime.now())
                  ? () => _rescheduleTask(context, ref, task)
                  : null,
            ),
          ),
        const Divider(),
        Text('Route memory', style: Theme.of(context).textTheme.titleMedium),
        Text(state.routeProfile.sampleCount == 0
            ? 'No route observations yet. Add a route to build a local estimate.'
            : '${state.routeProfile.originCluster} to ${state.routeProfile.destinationCluster}: ${state.routeProfile.typicalDuration.inMinutes} min, ${state.routeProfile.sampleCount} samples'),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Events', style: Theme.of(context).textTheme.titleMedium),
            TextButton.icon(
              onPressed: () => _addEvent(context, ref),
              icon: const Icon(Icons.add),
              label: const Text('Add event'),
            ),
          ],
        ),
        TextButton.icon(
          onPressed: () => _recordRoute(context, ref),
          icon: const Icon(Icons.add_road),
          label: const Text('Record a travel time'),
        ),
        if (events.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text('No events yet. Add one to build a plan.'),
          ),
        for (final event in events)
          ListTile(
            leading: const Icon(Icons.event_outlined),
            title: Text(event.title),
            subtitle: Text('${event.startsAt} - ${event.endsAt}'),
            trailing: IconButton(
              tooltip: 'Delete appointment',
              icon: const Icon(Icons.delete_outline),
              onPressed: () => ref
                  .read(appStateProvider.notifier)
                  .deleteManualEvent(event.id),
            ),
          ),
      ],
    );
  }

  static Future<void> _rescheduleTask(
    BuildContext context,
    WidgetRef ref,
    PlannerTask task,
  ) async {
    final now = DateTime.now();
    final initial = task.earliestStart != null &&
            task.earliestStart!.isAfter(now) &&
            task.earliestStart!.isBefore(task.deadline)
        ? task.earliestStart!
        : now;
    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate:
          DateTime(task.deadline.year, task.deadline.month, task.deadline.day),
    );
    if (date == null || !context.mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initial),
    );
    if (time == null || !context.mounted) return;
    final earliest =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    if (!earliest.isAfter(DateTime.now())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Choose a start time in the future.')),
      );
      return;
    }
    await ref.read(appStateProvider.notifier).rescheduleTask(task.id, earliest);
  }

  static Future<void> _addTask(BuildContext context, WidgetRef ref) async {
    final title = TextEditingController();
    final minutes = TextEditingController(text: '30');
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    var deadline = DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 18);
    var priority = PlannerTaskPriority.normal;
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Add a task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: title,
                  decoration: const InputDecoration(labelText: 'Task')),
              TextField(
                  controller: minutes,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Estimated minutes')),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Deadline'),
                subtitle: Text(deadline.toString()),
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: deadline.isBefore(DateTime.now())
                        ? DateTime.now()
                        : deadline,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 730)),
                  );
                  if (selectedDate == null || !context.mounted) return;
                  final selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(deadline),
                  );
                  if (selectedTime == null) return;
                  setDialogState(() => deadline = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      ));
                },
              ),
              DropdownButtonFormField<PlannerTaskPriority>(
                initialValue: priority,
                decoration: const InputDecoration(labelText: 'Priority'),
                items: PlannerTaskPriority.values
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(value.name),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) setDialogState(() => priority = value);
                },
              ),
              const SizedBox(height: 8),
              const Text(
                'Plan slots use 9:00 AM as the default start and only account for events you have entered.',
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(dialogContext, false),
                child: const Text('Cancel')),
            FilledButton(
                onPressed: () => Navigator.pop(dialogContext, true),
                child: const Text('Save')),
          ],
        ),
      ),
    );
    final parsedMinutes = int.tryParse(minutes.text);
    if (result == true &&
        context.mounted &&
        parsedMinutes != null &&
        parsedMinutes > 0) {
      await ref.read(appStateProvider.notifier).addTask(
            title: title.text,
            duration: Duration(minutes: parsedMinutes),
            deadline: deadline,
            priority: priority,
          );
    }
    title.dispose();
    minutes.dispose();
  }

  static Future<void> _addEvent(BuildContext context, WidgetRef ref) async {
    var title = '';
    var location = '';
    final initial = DateTime.now().add(const Duration(days: 1));
    var startsAt = DateTime(initial.year, initial.month, initial.day, 9);
    var endsAt = startsAt.add(const Duration(hours: 1));
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Add an event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => title = value,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                onChanged: (value) => location = value,
                decoration:
                    const InputDecoration(labelText: 'Location (optional)'),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Starts'),
                subtitle: Text(startsAt.toString()),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: startsAt,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 730)),
                  );
                  if (date == null || !context.mounted) {
                    return;
                  }
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(startsAt),
                  );
                  if (time == null) {
                    return;
                  }
                  setDialogState(() {
                    startsAt = DateTime(date.year, date.month, date.day,
                        time.hour, time.minute);
                    if (!endsAt.isAfter(startsAt)) {
                      endsAt = startsAt.add(const Duration(hours: 1));
                    }
                  });
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Ends'),
                subtitle: Text(endsAt.toString()),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: endsAt,
                    firstDate: startsAt,
                    lastDate: DateTime.now().add(const Duration(days: 730)),
                  );
                  if (date == null || !context.mounted) {
                    return;
                  }
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(endsAt),
                  );
                  if (time == null) {
                    return;
                  }
                  setDialogState(() => endsAt = DateTime(
                      date.year, date.month, date.day, time.hour, time.minute));
                },
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(dialogContext, false),
                child: const Text('Cancel')),
            FilledButton(
                onPressed: () => Navigator.pop(dialogContext, true),
                child: const Text('Save')),
          ],
        ),
      ),
    );
    if (result == true && context.mounted) {
      await ref.read(appStateProvider.notifier).addManualEvent(
            title: title,
            startsAt: startsAt,
            endsAt: endsAt,
            locationName: location,
          );
    }
  }

  static Future<void> _recordRoute(BuildContext context, WidgetRef ref) async {
    final duration = TextEditingController();
    final result = await showDialog<int>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Record travel time'),
        content: TextField(
          controller: duration,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Minutes'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel')),
          FilledButton(
            onPressed: () =>
                Navigator.pop(dialogContext, int.tryParse(duration.text)),
            child: const Text('Save'),
          ),
        ],
      ),
    );
    duration.dispose();
    if (result != null && result > 0 && context.mounted) {
      await ref.read(appStateProvider.notifier).recordRouteObservation(
            durationMinutes: result,
            transport: 'user_reported',
          );
    }
  }
}
