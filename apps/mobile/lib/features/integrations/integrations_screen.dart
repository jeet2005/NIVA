import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class IntegrationsScreen extends StatelessWidget {
  const IntegrationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
            'Connections are optional. Nothing is accessed until a provider is connected and permission is granted.'),
        const SizedBox(height: 12),
        const ListTile(
          leading: Icon(Icons.event_outlined),
          title: Text('Calendar'),
          subtitle: Text(
              'Not connected • add events manually or connect an account in a future release'),
          isThreeLine: true,
        ),
        const ListTile(
          leading: Icon(Icons.cloud_outlined),
          title: Text('Weather'),
          subtitle: Text('Unavailable • no weather provider configured'),
        ),
        const ListTile(
          leading: Icon(Icons.location_on_outlined),
          title: Text('Location'),
          subtitle: Text('Off • location permission is not requested'),
        ),
        const ListTile(
          leading: Icon(Icons.notifications_outlined),
          title: Text('Notifications'),
          subtitle: Text(
              'Plan reminders are shown in the app; system scheduling is not connected'),
          isThreeLine: true,
        ),
        const ListTile(
          leading: Icon(Icons.mail_outline),
          title: Text('Gmail'),
          subtitle:
              Text('Not connected • deferred until core planning is stable'),
        ),
        if (kDebugMode)
          ListTile(
            leading: const Icon(Icons.science_outlined),
            title: const Text('Context simulator'),
            subtitle: const Text('Run a local development scenario'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/simulator'),
          ),
      ],
    );
  }
}
