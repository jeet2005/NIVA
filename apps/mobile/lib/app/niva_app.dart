import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/branding/brand_config.dart';
import '../features/conversation/conversation_screen.dart';
import '../features/home/home_screen.dart';
import '../features/integrations/integrations_screen.dart';
import '../features/integrations/context_simulator_screen.dart';
import '../features/memories/memories_screen.dart';
import '../features/plans/plan_screen.dart';
import '../features/privacy/privacy_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/today/today_screen.dart';
import 'app_state.dart';

class NivaApp extends StatelessWidget {
  const NivaApp({super.key, this.theme});

  final ThemeData? theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: brandConfig.productName,
      theme: theme ??
          ThemeData(
            useMaterial3: true,
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFF2F6F66)),
          ),
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => NivaScaffold(child: child),
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
        GoRoute(
            path: '/today', builder: (context, state) => const TodayScreen()),
        GoRoute(
          path: '/conversation',
          builder: (context, state) => const ConversationScreen(),
        ),
        GoRoute(
          path: '/memories',
          builder: (context, state) => const MemoriesScreen(),
        ),
        GoRoute(
            path: '/plans', builder: (context, state) => const PlanScreen()),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: '/integrations',
          builder: (context, state) => const IntegrationsScreen(),
        ),
        if (kDebugMode)
          GoRoute(
            path: '/simulator',
            builder: (context, state) => const ContextSimulatorScreen(),
          ),
        GoRoute(
          path: '/privacy',
          builder: (context, state) => const PrivacyScreen(),
        ),
      ],
    ),
  ],
);

class NivaScaffold extends ConsumerStatefulWidget {
  const NivaScaffold({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<NivaScaffold> createState() => _NivaScaffoldState();
}

class _NivaScaffoldState extends ConsumerState<NivaScaffold>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.read(appStateProvider.notifier).reconcileReminders();
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final index = _destinations.indexWhere((item) => item.path == location);
    return Scaffold(
      appBar: AppBar(title: Text(brandConfig.productName)),
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index < 0 ? 0 : index,
        onDestinationSelected: (selected) =>
            context.go(_destinations[selected].path),
        destinations: [
          for (final item in _destinations)
            NavigationDestination(icon: Icon(item.icon), label: item.label),
        ],
      ),
    );
  }
}

class _Destination {
  const _Destination(this.path, this.label, this.icon);

  final String path;
  final String label;
  final IconData icon;
}

const _destinations = [
  _Destination('/', 'Home', Icons.home_outlined),
  _Destination('/today', 'Today', Icons.today_outlined),
  _Destination('/conversation', 'Chat', Icons.chat_bubble_outline),
  _Destination('/memories', 'Memory', Icons.psychology_alt_outlined),
  _Destination('/plans', 'Plan', Icons.route_outlined),
];
