import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        Text('Local-first by default'),
        SizedBox(height: 12),
        Text(
          'NIVA stores derived planning context before raw data wherever possible. External integrations are off until connected by the user.',
        ),
      ],
    );
  }
}
