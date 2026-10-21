import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

import '../models/reminder_record.dart';
import 'reminder_scheduler.dart';

class AndroidReminderPlatform implements ReminderPlatform {
  AndroidReminderPlatform(this._plugin);

  final FlutterLocalNotificationsPlugin _plugin;
  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;
    tz_data.initializeTimeZones();
    // Reminder times are persisted as DateTime instants; use UTC so Android
    // time-zone changes do not silently shift an already-created appointment.
    tz.setLocalLocation(tz.UTC);
    await _plugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      ),
    );
    _initialized = true;
  }

  AndroidFlutterLocalNotificationsPlugin? get _android =>
      _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

  @override
  Future<ReminderPermission> checkPermission() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
      return ReminderPermission.unavailable;
    }
    await initialize();
    final enabled = await _android!.areNotificationsEnabled();
    if (enabled == null) return ReminderPermission.unavailable;
    return enabled ? ReminderPermission.granted : ReminderPermission.denied;
  }

  @override
  Future<ReminderPermission> requestPermission() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
      return ReminderPermission.unavailable;
    }
    await initialize();
    final granted = await _android?.requestNotificationsPermission();
    if (granted == true) return ReminderPermission.granted;
    if (granted == false) return ReminderPermission.denied;
    return checkPermission();
  }

  @override
  Future<Set<int>> pendingNotificationIds() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) return {};
    await initialize();
    final pending = await _plugin.pendingNotificationRequests();
    return pending.map((request) => request.id).toSet();
  }

  @override
  Future<void> schedule(ReminderRecord reminder) async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) return;
    await initialize();
    await _plugin.zonedSchedule(
      id: reminder.notificationId,
      title: reminder.title,
      body: reminder.body,
      scheduledDate: tz.TZDateTime.from(reminder.scheduledFor.toUtc(), tz.UTC),
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'niva_reminders',
          'NIVA reminders',
          channelDescription:
              'Local reminders for tasks, deadlines, and appointments.',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: reminder.key,
    );
  }

  @override
  Future<void> cancel(int notificationId) async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) return;
    await initialize();
    await _plugin.cancel(id: notificationId);
  }
}
