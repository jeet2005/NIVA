import 'package:flutter/material.dart';

import '../../context/context_engine.dart';
import '../../context/relevance_engine.dart';
import '../../models/calendar_event.dart';
import '../../models/context_snapshot.dart';
import '../../models/daily_plan.dart';
import '../../models/memory.dart';
import '../../models/route_profile.dart';
import '../../models/weather.dart';
import '../../models/relevance.dart';
import '../../planning/planning_engine.dart';

class ContextSimulatorScreen extends StatefulWidget {
  const ContextSimulatorScreen({super.key});

  @override
  State<ContextSimulatorScreen> createState() => _ContextSimulatorScreenState();
}

class _ContextSimulatorScreenState extends State<ContextSimulatorScreen> {
  final _eventTitle = TextEditingController(text: 'College');
  final _preparation = TextEditingController(text: '48');
  final _route = TextEditingController(text: '43');
  final _currentRoute = TextEditingController(text: '43');
  var _hour = 9;
  var _rain = false;
  var _car = false;
  var _alreadyTravelling = false;
  String? _report;

  @override
  void dispose() {
    _eventTitle.dispose();
    _preparation.dispose();
    _route.dispose();
    _currentRoute.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Context simulator',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          const Text(
              'Development fixture. Changes here do not alter personal memories or connected services.'),
          TextField(
              controller: _eventTitle,
              decoration: const InputDecoration(labelText: 'Event')),
          TextField(
              controller: _preparation,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Preparation minutes')),
          TextField(
              controller: _route,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Normal travel minutes')),
          TextField(
              controller: _currentRoute,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Current travel minutes')),
          DropdownButtonFormField<int>(
            initialValue: _hour,
            decoration:
                const InputDecoration(labelText: 'Event hour (tomorrow)'),
            items: [
              for (var hour = 6; hour <= 22; hour++)
                DropdownMenuItem(value: hour, child: Text('$hour:00'))
            ],
            onChanged: (value) {
              if (value != null) setState(() => _hour = value);
            },
          ),
          SwitchListTile(
              title: const Text('Rain during commute'),
              value: _rain,
              onChanged: (value) => setState(() => _rain = value)),
          SwitchListTile(
              title: const Text('Taking the car'),
              value: _car,
              onChanged: (value) => setState(() => _car = value)),
          SwitchListTile(
              title: const Text('Already travelling'),
              value: _alreadyTravelling,
              onChanged: (value) => setState(() => _alreadyTravelling = value)),
          FilledButton.icon(
              onPressed: _evaluate,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Evaluate context')),
          if (_report != null) ...[
            const Divider(height: 32),
            SelectableText(_report!),
          ],
        ],
      );

  void _evaluate() {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final title = _eventTitle.text.trim();
    final prep = int.tryParse(_preparation.text) ?? 0;
    final normal = int.tryParse(_route.text) ?? 0;
    final current = int.tryParse(_currentRoute.text) ?? normal;
    if (title.isEmpty ||
        prep < 0 ||
        prep > 720 ||
        normal < 0 ||
        normal > 720 ||
        current < 0 ||
        current > 720) {
      setState(() => _report =
          'Invalid input: enter an event title and durations from 0 to 720 minutes.');
      return;
    }
    final start = DateTime(tomorrow.year, tomorrow.month, tomorrow.day, _hour);
    final event = CalendarEvent(
        id: 'simulated-event',
        title: title,
        startsAt: start,
        endsAt: start.add(const Duration(hours: 1)));
    final estimate = normal == 0
        ? null
        : RouteEstimate(
            routeProfileId: 'simulated-route',
            duration: Duration(minutes: current),
            normalDuration: Duration(minutes: normal),
            source: 'simulator_input',
            fetchedAt: now,
          );
    final weather = _rain
        ? [
            WeatherEvent(
              id: 'simulated-rain',
              condition: WeatherCondition.rain,
              startsAt: start.subtract(const Duration(hours: 2)),
              endsAt: start,
              probability: 0.8,
              severity: 2,
              source: 'simulator_input',
              fetchedAt: now,
            )
          ]
        : const <WeatherEvent>[];
    final memories = _car
        ? [
            Memory(
              id: 'simulated-car',
              type: MemoryType.temporaryContext,
              title: 'Transport for tomorrow',
              value: 'car',
              source: MemorySource.explicitUserStatement,
              confidence: MemoryConfidence.high,
              condition: 'transport.tomorrow',
              expiresAt: tomorrow.add(const Duration(days: 1)),
              createdAt: now,
              updatedAt: now,
            )
          ]
        : const <Memory>[];
    final snapshot = const ContextEngine().buildSnapshot(
      now: now,
      upcomingEvents: [event],
      memories: memories,
      weatherEvents: weather,
      routeEstimate: estimate,
      activity:
          _alreadyTravelling ? ActivityState.vehicle : ActivityState.stationary,
      activityConfidence: 1,
      activityTimestamp: now,
    );
    final relevance = const RelevanceEngine().evaluateWeather(snapshot);
    final traffic = const RelevanceEngine().evaluateTraffic(snapshot);
    final temporaryTransportEstimate = _car && estimate != null
        ? RouteEstimate(
            routeProfileId: estimate.routeProfileId,
            duration: Duration(minutes: (current * 0.65).round()),
            normalDuration: estimate.normalDuration,
            source: 'simulator_car_fixture',
            fetchedAt: now,
          )
        : estimate;
    final plan = const PlanningEngine().buildDailyPlan(PlanningInput(
      date: tomorrow,
      events: [event],
      memories: memories,
      preparationDuration: Duration(minutes: prep),
      travelDuration: temporaryTransportEstimate?.duration ?? Duration.zero,
      defaultBuffer: const Duration(minutes: 12),
      now: now,
      routeEstimate: temporaryTransportEstimate,
      weatherEvents: weather,
      weatherDecision: relevance,
    ));
    final wake = plan.plan.firstBlockOfType(PlanBlockType.wake);
    final leave = plan.plan.firstBlockOfType(PlanBlockType.departure);
    setState(() => _report = [
          'Relevance: ${relevance.action.name} (${relevance.score.toStringAsFixed(2)})',
          'Reason: ${relevance.explanation}',
          'Traffic delta: ${estimate?.delay.inMinutes ?? 0} min',
          'Traffic decision: ${traffic.action.name} (${traffic.explanation})',
          if (_car)
            'Transport: temporary car fixture (estimated duration ${temporaryTransportEstimate?.duration.inMinutes} min)',
          'Wake: ${wake?.startsAt ?? 'unknown; no route estimate'}',
          'Leave: ${leave?.startsAt ?? 'unknown; no route estimate'}',
          'Plan evidence: ${plan.plan.evidenceIds.join(', ')}',
          'Notification: ${relevance.action == RecommendedAction.notify || traffic.action == RecommendedAction.reschedule ? 'candidate only; Android delivery is not connected' : 'none'}',
        ].join('\n\n'));
  }
}
