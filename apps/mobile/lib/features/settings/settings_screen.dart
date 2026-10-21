import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_state.dart';
import '../../models/user_profile.dart';
import '../../core/time/time_window.dart';
import '../../notifications/reminder_scheduler.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStateProvider);
    final profile = state.profile;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('Profile', style: Theme.of(context).textTheme.titleMedium),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(profile.displayName),
          subtitle: Text('${profile.timezone} - ${profile.locale}'),
          trailing: IconButton(
            tooltip: 'Edit name',
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => _editName(context, ref, profile.displayName),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Wake window'),
          subtitle: Text(_windowLabel(profile.typicalWakeWindow)),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Sleep window'),
          subtitle: Text(_windowLabel(profile.typicalSleepWindow)),
        ),
        const SizedBox(height: 16),
        Text('Tone', style: Theme.of(context).textTheme.titleMedium),
        SegmentedButton<PreferredTone>(
          segments: const [
            ButtonSegment(value: PreferredTone.warm, label: Text('Warm')),
            ButtonSegment(value: PreferredTone.concise, label: Text('Concise')),
            ButtonSegment(value: PreferredTone.direct, label: Text('Direct')),
          ],
          selected: {profile.preferredTone},
          onSelectionChanged: (selection) {
            ref
                .read(appStateProvider.notifier)
                .updateProfilePreferences(tone: selection.single);
          },
        ),
        const SizedBox(height: 16),
        Text(
          'Notification level',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        DropdownButtonFormField<NotificationLevel>(
          initialValue: profile.preferredNotificationLevel,
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
              ref
                  .read(appStateProvider.notifier)
                  .updateProfilePreferences(notificationLevel: value);
            }
          },
        ),
        const SizedBox(height: 20),
        Text('Reminders', style: Theme.of(context).textTheme.titleMedium),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(_permissionIcon(state.reminderPermission)),
          title: const Text('Task and appointment notifications'),
          subtitle: Text(_permissionLabel(state.reminderPermission)),
          trailing: state.reminderPermission == ReminderPermission.granted
              ? IconButton(
                  tooltip: 'Refresh permission status',
                  onPressed: () => ref
                      .read(appStateProvider.notifier)
                      .refreshReminderPermission(),
                  icon: const Icon(Icons.refresh),
                )
              : FilledButton.tonal(
                  onPressed:
                      state.reminderPermission == ReminderPermission.unavailable
                          ? null
                          : () => ref
                              .read(appStateProvider.notifier)
                              .requestReminderPermission(),
                  child: Text(
                      state.reminderPermission == ReminderPermission.denied
                          ? 'Enable'
                          : 'Unavailable'),
                ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            'Reminders work offline. Android may delay inexact notifications, and delivery depends on device settings.',
          ),
        ),
      ],
    );
  }

  static String _windowLabel(TimeWindow window) =>
      '${window.startHour.toString().padLeft(2, '0')}:${window.startMinute.toString().padLeft(2, '0')} – ${window.endHour.toString().padLeft(2, '0')}:${window.endMinute.toString().padLeft(2, '0')}';

  static String _permissionLabel(ReminderPermission permission) =>
      switch (permission) {
        ReminderPermission.granted =>
          'Permission granted. Android scheduling is enabled.',
        ReminderPermission.denied =>
          'Permission denied. Tasks and plans still work; reminders wait until enabled.',
        ReminderPermission.unavailable =>
          'Notification permissions are unavailable on this platform.',
      };

  static IconData _permissionIcon(ReminderPermission permission) =>
      switch (permission) {
        ReminderPermission.granted => Icons.notifications_active_outlined,
        ReminderPermission.denied => Icons.notifications_off_outlined,
        ReminderPermission.unavailable => Icons.notifications_paused_outlined,
      };

  static Future<void> _editName(
    BuildContext context,
    WidgetRef ref,
    String currentName,
  ) async {
    final controller = TextEditingController(text: currentName);
    final name = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Your name'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(labelText: 'Name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('Save'),
          ),
        ],
      ),
    );
    controller.dispose();
    if (name != null && context.mounted) {
      await ref.read(appStateProvider.notifier).updateDisplayName(name);
    }
  }
}
