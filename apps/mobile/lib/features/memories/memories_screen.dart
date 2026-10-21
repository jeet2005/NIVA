import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_state.dart';
import '../../models/memory.dart';

class MemoriesScreen extends ConsumerWidget {
  const MemoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memories = ref.watch(appStateProvider).memories;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('What NIVA remembers',
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        _Section(
          title: 'You told me',
          memories: memories
              .where((memory) => memory.type == MemoryType.explicitPreference)
              .toList(),
        ),
        _Section(
          title: 'For now',
          memories: memories
              .where((memory) => memory.type == MemoryType.temporaryContext)
              .toList(),
        ),
        _Section(
          title: 'I noticed',
          memories: memories
              .where((memory) => memory.type == MemoryType.observedPattern)
              .toList(),
        ),
      ],
    );
  }
}

class _Section extends ConsumerWidget {
  const _Section({required this.title, required this.memories});

  final String title;
  final List<Memory> memories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          if (memories.isEmpty) const Text('Nothing stored yet.'),
          for (final memory in memories)
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(memory.title),
              subtitle: Text(
                '${memory.value}\nSource: ${memory.source.name} • ${memory.confidence.name}'
                '${memory.expiresAt == null ? '' : '\nExpires: ${memory.expiresAt}'}'
                '${memory.updatedAt == memory.createdAt ? '' : '\nUpdated: ${memory.updatedAt}'}',
              ),
              isThreeLine: memory.expiresAt != null ||
                  memory.updatedAt != memory.createdAt,
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                tooltip: 'Forget',
                onPressed: () {
                  ref.read(appStateProvider.notifier).forgetMemory(memory.id);
                },
              ),
            ),
        ],
      ),
    );
  }
}
