import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../agents/mock_agent.dart';
import '../agents/groq_assistant.dart';
import '../context/context_engine.dart';
import '../context/relevance_engine.dart';
import '../core/time/time_window.dart';
import '../memory/memory_service.dart';
import '../notifications/android_reminder_platform.dart';
import '../notifications/reminder_scheduler.dart';
import '../models/alarm.dart';
import '../models/calendar_event.dart';
import '../models/context_snapshot.dart';
import '../models/daily_plan.dart';
import '../models/evidence.dart';
import '../models/memory.dart';
import '../models/planner_task.dart';
import '../models/route_profile.dart';
import '../models/user_profile.dart';
import '../models/weather.dart';
import '../planning/adaptive_alarm_service.dart';
import '../planning/planning_engine.dart';
import '../routing/route_memory_service.dart';
import '../storage/app_database.dart';
import '../storage/drift_local_store.dart';
import '../storage/local_store.dart';

class AppState {
  const AppState({
    required this.profile,
    required this.memories,
    required this.events,
    this.tasks = const [],
    required this.currentPlan,
    this.currentEvidence = const [],
    required this.currentAlarm,
    required this.routeProfile,
    required this.routeEstimate,
    required this.weatherEvents,
    required this.contextSnapshot,
    required this.messages,
    this.startupError,
    required this.hasCompletedOnboarding,
    required this.isLoaded,
    this.reminderPermission = ReminderPermission.unavailable,
  });

  final UserProfile profile;
  final List<Memory> memories;
  final List<CalendarEvent> events;
  final List<PlannerTask> tasks;
  final DailyPlan? currentPlan;
  final List<Evidence> currentEvidence;
  final AdaptiveAlarm? currentAlarm;
  final RouteProfile routeProfile;
  final RouteEstimate routeEstimate;
  final List<WeatherEvent> weatherEvents;
  final ContextSnapshot contextSnapshot;
  final List<String> messages;
  final String? startupError;
  final bool hasCompletedOnboarding;
  final bool isLoaded;
  final ReminderPermission reminderPermission;

  AppState copyWith({
    UserProfile? profile,
    List<Memory>? memories,
    List<CalendarEvent>? events,
    List<PlannerTask>? tasks,
    DailyPlan? currentPlan,
    bool clearCurrentPlan = false,
    List<Evidence>? currentEvidence,
    AdaptiveAlarm? currentAlarm,
    bool clearCurrentAlarm = false,
    RouteProfile? routeProfile,
    RouteEstimate? routeEstimate,
    List<WeatherEvent>? weatherEvents,
    ContextSnapshot? contextSnapshot,
    List<String>? messages,
    String? startupError,
    bool clearStartupError = false,
    bool? hasCompletedOnboarding,
    bool? isLoaded,
    ReminderPermission? reminderPermission,
  }) {
    return AppState(
      profile: profile ?? this.profile,
      memories: memories ?? this.memories,
      events: events ?? this.events,
      tasks: tasks ?? this.tasks,
      currentPlan: clearCurrentPlan ? null : currentPlan ?? this.currentPlan,
      currentEvidence: currentEvidence ?? this.currentEvidence,
      currentAlarm:
          clearCurrentAlarm ? null : currentAlarm ?? this.currentAlarm,
      routeProfile: routeProfile ?? this.routeProfile,
      routeEstimate: routeEstimate ?? this.routeEstimate,
      weatherEvents: weatherEvents ?? this.weatherEvents,
      contextSnapshot: contextSnapshot ?? this.contextSnapshot,
      messages: messages ?? this.messages,
      startupError:
          clearStartupError ? null : startupError ?? this.startupError,
      hasCompletedOnboarding:
          hasCompletedOnboarding ?? this.hasCompletedOnboarding,
      isLoaded: isLoaded ?? this.isLoaded,
      reminderPermission: reminderPermission ?? this.reminderPermission,
    );
  }
}

class AppStateController extends StateNotifier<AppState> {
  AppStateController(this._store,
      {ReminderScheduler? reminderScheduler, GroqAssistant? groqAssistant})
      : _agent = const MockAgent(
          planningEngine: PlanningEngine(),
          memoryService: MemoryService(),
        ),
        _contextEngine = const ContextEngine(),
        _groqAssistant = groqAssistant ?? GroqAssistant(),
        _relevanceEngine = const RelevanceEngine(),
        _alarmService = const AdaptiveAlarmService(),
        _reminderScheduler = reminderScheduler ??
            ReminderScheduler(
              _store,
              AndroidReminderPlatform(FlutterLocalNotificationsPlugin()),
            ),
        super(_initialState()) {
    _load();
  }

  final LocalStore _store;
  final MockAgent _agent;
  final MemoryService _memoryService = const MemoryService();
  final ContextEngine _contextEngine;
  final GroqAssistant _groqAssistant;
  final RelevanceEngine _relevanceEngine;
  final AdaptiveAlarmService _alarmService;
  final ReminderScheduler _reminderScheduler;
  final RouteMemoryService _routeMemoryService = const RouteMemoryService();

  static AppState _initialState() {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final routeProfile = RouteProfile(
      id: 'home-campus',
      originCluster: 'home',
      destinationCluster: 'campus',
      typicalTransport: 'walking',
      typicalDuration: const Duration(minutes: 43),
      variance: 16,
      dayOfWeek: tomorrow.weekday,
      timeWindowLabel: 'morning',
      // This is a development fixture, not an observation from the user.
      sampleCount: 0,
      lastUpdated: now,
    );
    final routeEstimate = RouteEstimate(
      routeProfileId: routeProfile.id,
      duration: Duration.zero,
      normalDuration: Duration.zero,
      source: 'unavailable',
      fetchedAt: now,
    );
    // Keep the first launch honest: events and weather must come from the
    // user's calendar or a clearly marked development simulation.
    const List<WeatherEvent> weatherEvents = [];
    const List<CalendarEvent> events = [];
    return AppState(
      profile: UserProfile(
        id: 'local-user',
        displayName: 'Friend',
        timezone: 'Asia/Calcutta',
        locale: 'en_IN',
        preferredTone: PreferredTone.warm,
        preferredNotificationLevel: NotificationLevel.balanced,
        defaultTravelBuffer: const Duration(minutes: 12),
        typicalSleepWindow: const TimeWindow(
          startHour: 23,
          startMinute: 0,
          endHour: 7,
          endMinute: 0,
        ),
        typicalWakeWindow: const TimeWindow(
          startHour: 6,
          startMinute: 30,
          endHour: 8,
          endMinute: 30,
        ),
        createdAt: now,
        updatedAt: now,
      ),
      memories: const [],
      events: events,
      currentPlan: null,
      currentAlarm: null,
      routeProfile: routeProfile,
      routeEstimate: routeEstimate,
      weatherEvents: weatherEvents,
      contextSnapshot: ContextSnapshot(
        createdAt: now,
        upcomingEvents: events,
        memories: const [],
        weatherEvents: weatherEvents,
        routeEstimate: routeEstimate,
        activity: ActivityState.stationary,
        activityConfidence: 0.8,
        activityTimestamp: now,
      ),
      messages: const [
        "NIVA: Hi. I can build a local deterministic plan for tomorrow.",
      ],
      hasCompletedOnboarding: false,
      isLoaded: false,
    );
  }

  Future<void> _load() async {
    try {
      final seeded = _initialState();
      final profile = await _store.readProfile();
      final events = await _store.readCalendarEvents();
      final tasks = await _store.readTasks();
      var routeProfiles = await _store.readRouteProfiles();
      final weatherEvents = await _store.readWeatherEvents();
      final memories = await _store.readMemories();
      final reminders = await _store.readReminders();
      final plan = await _store.readLatestPlan();
      final alarms = await _store.readAlarms();

      if (routeProfiles.isEmpty) {
        routeProfiles = [seeded.routeProfile];
        await _store.saveRouteProfile(seeded.routeProfile);
      }
      final routeProfile = routeProfiles.first;
      final now = DateTime.now();
      final routeEstimate = _routeEstimateForProfile(routeProfile, now) ??
          RouteEstimate(
            routeProfileId: routeProfile.id,
            duration: Duration.zero,
            normalDuration: Duration.zero,
            source: 'unavailable',
            fetchedAt: now,
          );
      final snapshot = _contextEngine.buildSnapshot(
        now: now,
        upcomingEvents: events,
        memories: memories,
        weatherEvents: weatherEvents,
        routeEstimate:
            routeEstimate.source == 'unavailable' ? null : routeEstimate,
        activity: ActivityState.stationary,
        activityConfidence: 0.8,
        activityTimestamp: now,
        tasks: tasks,
        plan: plan,
        reminders: reminders,
      );
      final evidence = plan == null
          ? const <Evidence>[]
          : _restorePlanEvidence(plan, snapshot, tasks);

      state = seeded.copyWith(
        profile: profile ?? seeded.profile,
        memories: memories,
        events: events,
        tasks: tasks,
        currentPlan: plan,
        currentEvidence: evidence,
        currentAlarm: _firstActiveAlarm(alarms),
        routeProfile: routeProfile,
        routeEstimate: routeEstimate,
        weatherEvents: weatherEvents,
        contextSnapshot: snapshot,
        hasCompletedOnboarding: profile != null,
        isLoaded: true,
      );
      await _reconcileReminders();
    } catch (_) {
      state = state.copyWith(
        isLoaded: true,
        startupError:
            'Local data could not be loaded. Some saved information may be unavailable.',
      );
    }
  }

  RouteEstimate? _routeEstimateForProfile(RouteProfile profile, DateTime now) {
    if (profile.sampleCount == 0) return null;
    return RouteEstimate(
      routeProfileId: profile.id,
      duration: profile.typicalDuration,
      normalDuration: profile.typicalDuration,
      source: 'local_route_memory',
      fetchedAt: now,
    );
  }

  List<Evidence> _restorePlanEvidence(
    DailyPlan plan,
    ContextSnapshot snapshot,
    List<PlannerTask> tasks,
  ) {
    final ids = plan.evidenceIds.toSet();
    final restored = <Evidence>[];
    final eventBlocks = plan.blocks
        .where((block) => block.type == PlanBlockType.event)
        .toList();
    for (final block in eventBlocks) {
      final eventId = block.id.replaceFirst('event-', '');
      final id = 'evidence-event-$eventId';
      if (!ids.contains(id)) continue;
      restored.add(Evidence(
        id: id,
        source: EvidenceSource.retrieved,
        summary: '${block.title} starts at ${block.startsAt}',
        timestamp: plan.updatedAt,
        confidence: 1,
      ));
    }

    for (final task in tasks) {
      final id = 'evidence-task-${task.id}';
      if (!ids.contains(id)) continue;
      final block = plan.blocks.where(
        (item) =>
            item.id == 'task-${task.id}' || item.id == 'conflict-${task.id}',
      );
      final scheduled = block.isEmpty ? null : block.first;
      restored.add(Evidence(
        id: id,
        source: EvidenceSource.userExplicit,
        summary: scheduled?.type == PlanBlockType.task
            ? 'Task “${task.title}” was planned for ${scheduled!.startsAt} to ${scheduled.endsAt}; duration ${task.duration.inMinutes} min, deadline ${task.deadline}.'
            : 'Task “${task.title}” needs ${task.duration.inMinutes} min before ${task.deadline}.',
        timestamp: plan.updatedAt,
        confidence: 1,
      ));
    }

    final preparation = plan.firstBlockOfType(PlanBlockType.preparation);
    if (preparation != null && ids.contains('evidence-preparation')) {
      restored.add(Evidence(
        id: 'evidence-preparation',
        source: EvidenceSource.computed,
        summary:
            'Preparation duration ${preparation.endsAt.difference(preparation.startsAt).inMinutes} min',
        timestamp: plan.updatedAt,
        confidence: 1,
      ));
    }
    final travel = plan.firstBlockOfType(PlanBlockType.travel);
    if (travel != null && ids.contains('evidence-travel')) {
      restored.add(Evidence(
        id: 'evidence-travel',
        source: snapshot.routeEstimate == null
            ? EvidenceSource.computed
            : EvidenceSource.retrieved,
        summary:
            'Travel duration ${travel.endsAt.difference(travel.startsAt).inMinutes} min',
        timestamp: snapshot.routeEstimate?.fetchedAt ?? plan.updatedAt,
        confidence: snapshot.routeEstimate == null ? null : 1,
      ));
    }
    if (ids.contains('evidence-buffer')) {
      final firstEvent = eventBlocks.isEmpty ? null : eventBlocks.first;
      if (firstEvent != null && travel != null) {
        final bufferMinutes =
            firstEvent.startsAt.difference(travel.endsAt).inMinutes;
        if (bufferMinutes >= 0) {
          restored.add(Evidence(
            id: 'evidence-buffer',
            source: EvidenceSource.computed,
            summary: 'Buffer $bufferMinutes min',
            timestamp: plan.updatedAt,
            confidence: 1,
          ));
        }
      }
    }
    if (ids.contains('evidence-weather')) {
      final decision = _relevanceEngine.evaluateWeather(snapshot);
      if (decision.evidenceIds.isNotEmpty) {
        restored.add(Evidence(
          id: 'evidence-weather',
          source: EvidenceSource.retrieved,
          summary: decision.explanation,
          timestamp: plan.updatedAt,
          confidence: decision.score,
        ));
      }
    }
    return restored;
  }

  Future<void> completeOnboarding({
    required String displayName,
    required PreferredTone tone,
    required NotificationLevel notificationLevel,
  }) async {
    final now = DateTime.now();
    final profile = UserProfile(
      id: state.profile.id,
      displayName: displayName.trim().isEmpty ? 'Friend' : displayName.trim(),
      timezone: state.profile.timezone,
      locale: state.profile.locale,
      preferredTone: tone,
      preferredNotificationLevel: notificationLevel,
      defaultTravelBuffer: state.profile.defaultTravelBuffer,
      typicalSleepWindow: state.profile.typicalSleepWindow,
      typicalWakeWindow: state.profile.typicalWakeWindow,
      createdAt: state.profile.createdAt,
      updatedAt: now,
    );
    await _store.saveProfile(profile);
    state = state.copyWith(
      profile: profile,
      hasCompletedOnboarding: true,
    );
  }

  Future<void> updateProfilePreferences({
    PreferredTone? tone,
    NotificationLevel? notificationLevel,
    Duration? defaultTravelBuffer,
  }) async {
    final now = DateTime.now();
    final profile = UserProfile(
      id: state.profile.id,
      displayName: state.profile.displayName,
      timezone: state.profile.timezone,
      locale: state.profile.locale,
      preferredTone: tone ?? state.profile.preferredTone,
      preferredNotificationLevel:
          notificationLevel ?? state.profile.preferredNotificationLevel,
      defaultTravelBuffer:
          defaultTravelBuffer ?? state.profile.defaultTravelBuffer,
      typicalSleepWindow: state.profile.typicalSleepWindow,
      typicalWakeWindow: state.profile.typicalWakeWindow,
      createdAt: state.profile.createdAt,
      updatedAt: now,
    );
    await _store.saveProfile(profile);
    state = state.copyWith(profile: profile);
  }

  Future<void> updateDisplayName(String name) async {
    final cleaned = name.trim();
    if (cleaned.isEmpty) return;
    final profile = UserProfile(
      id: state.profile.id,
      displayName: cleaned,
      timezone: state.profile.timezone,
      locale: state.profile.locale,
      preferredTone: state.profile.preferredTone,
      preferredNotificationLevel: state.profile.preferredNotificationLevel,
      defaultTravelBuffer: state.profile.defaultTravelBuffer,
      typicalSleepWindow: state.profile.typicalSleepWindow,
      typicalWakeWindow: state.profile.typicalWakeWindow,
      createdAt: state.profile.createdAt,
      updatedAt: DateTime.now(),
    );
    await _store.saveProfile(profile);
    state = state.copyWith(profile: profile);
  }

  void dismissStartupError() {
    state = state.copyWith(clearStartupError: true);
  }

  Future<void> addManualEvent({
    required String title,
    required DateTime startsAt,
    required DateTime endsAt,
    String? locationName,
  }) async {
    final cleanTitle = title.trim();
    if (cleanTitle.isEmpty || !endsAt.isAfter(startsAt)) return;
    final event = CalendarEvent(
      id: 'manual-${startsAt.microsecondsSinceEpoch}',
      title: cleanTitle,
      startsAt: startsAt,
      endsAt: endsAt,
      locationName:
          locationName?.trim().isEmpty == true ? null : locationName?.trim(),
    );
    await _store.saveCalendarEvent(event);
    final events = [...state.events, event]
      ..sort((a, b) => a.startsAt.compareTo(b.startsAt));
    final snapshot = _contextEngine.buildSnapshot(
      now: DateTime.now(),
      upcomingEvents: events,
      memories: state.memories,
      weatherEvents: state.weatherEvents,
      routeEstimate: state.routeEstimate.source == 'unavailable'
          ? null
          : state.routeEstimate,
      activity: ActivityState.unknown,
      activityConfidence: 0,
      activityTimestamp: DateTime.now(),
    );
    state = state.copyWith(events: events, contextSnapshot: snapshot);
    if (event.startsAt.isAfter(DateTime.now())) {
      await _buildPlanFor(event.startsAt);
    }
    await _reconcileReminders();
  }

  Future<void> deleteManualEvent(String id) async {
    final matches = state.events.where((event) => event.id == id);
    if (matches.isEmpty) return;
    final removed = matches.first;
    await _store.deleteCalendarEvent(id);
    final events = state.events.where((event) => event.id != id).toList();
    state = state.copyWith(events: events);
    if (removed.startsAt.isAfter(DateTime.now())) {
      await _buildPlanFor(removed.startsAt);
    }
    await _reconcileReminders();
  }

  Future<void> addTask({
    required String title,
    required Duration duration,
    required DateTime deadline,
    PlannerTaskPriority priority = PlannerTaskPriority.normal,
    DateTime? earliestStart,
    String? notes,
  }) async {
    final cleanTitle = title.trim();
    if (cleanTitle.isEmpty ||
        duration <= Duration.zero ||
        duration > const Duration(days: 7)) {
      return;
    }
    final now = DateTime.now();
    final task = PlannerTask(
      id: 'task-${now.microsecondsSinceEpoch}',
      title: cleanTitle,
      duration: duration,
      deadline: deadline,
      priority: priority,
      status: PlannerTaskStatus.pending,
      createdAt: now,
      updatedAt: now,
      earliestStart: earliestStart,
      notes: notes?.trim().isEmpty == true ? null : notes?.trim(),
    );
    await _store.saveTask(task);
    final tasks = [...state.tasks, task];
    state = state.copyWith(tasks: tasks);
    await _buildPlanFor(deadline);
    await _reconcileReminders();
  }

  Future<void> setTaskStatus(String id, PlannerTaskStatus status) async {
    final now = DateTime.now();
    final matches = state.tasks.where((item) => item.id == id);
    if (matches.isEmpty) return;
    final task = matches.first;
    final updated = task.copyWith(status: status, updatedAt: now);
    await _store.saveTask(updated);
    final tasks =
        state.tasks.map((item) => item.id == id ? updated : item).toList();
    state = state.copyWith(tasks: tasks);
    await _buildPlanFor(task.deadline);
    await _reconcileReminders();
  }

  Future<void> rescheduleTask(String id, DateTime earliestStart) async {
    final matches = state.tasks.where((item) => item.id == id);
    if (matches.isEmpty) return;
    final task = matches.first;
    if (earliestStart.isBefore(DateTime.now()) ||
        !earliestStart.isBefore(task.deadline) ||
        task.status != PlannerTaskStatus.pending) {
      return;
    }
    final updated = task.copyWith(
      earliestStart: earliestStart,
      updatedAt: DateTime.now(),
    );
    await _store.saveTask(updated);
    state = state.copyWith(
      tasks: state.tasks.map((item) => item.id == id ? updated : item).toList(),
    );
    await _buildPlanFor(task.deadline);
    await _reconcileReminders();
  }

  Future<void> recordRouteObservation({
    required int durationMinutes,
    required String transport,
  }) async {
    if (durationMinutes <= 0 || durationMinutes > 1440) return;
    final now = DateTime.now();
    final observation = RouteObservation(
      id: 'route-observation-${now.microsecondsSinceEpoch}',
      routeProfileId: state.routeProfile.id,
      duration: Duration(minutes: durationMinutes),
      transport: transport,
      observedAt: now,
      source: 'user_entered',
    );
    final observations = [
      ...await _store.readRouteObservations(state.routeProfile.id),
      observation,
    ];
    final profile = _routeMemoryService.createOrUpdateProfile(
      id: state.routeProfile.id,
      originCluster: state.routeProfile.originCluster,
      destinationCluster: state.routeProfile.destinationCluster,
      transport: transport,
      observations: observations,
      now: now,
    );
    await _store.saveRouteObservation(observation);
    await _store.saveRouteProfile(profile);
    final estimate = RouteEstimate(
      routeProfileId: profile.id,
      duration: profile.typicalDuration,
      normalDuration: profile.typicalDuration,
      source: 'local_route_memory',
      fetchedAt: now,
    );
    final snapshot = _contextEngine.buildSnapshot(
      now: now,
      upcomingEvents: state.events,
      memories: state.memories,
      weatherEvents: state.weatherEvents,
      routeEstimate: estimate,
      activity: ActivityState.unknown,
      activityConfidence: 0,
      activityTimestamp: now,
      tasks: state.tasks,
      plan: state.currentPlan,
    );
    state = state.copyWith(
      routeProfile: profile,
      routeEstimate: estimate,
      contextSnapshot: snapshot,
    );
  }

  Future<void> _buildPlanFor(DateTime targetDate) async {
    final now = DateTime.now();
    final date = DateTime(targetDate.year, targetDate.month, targetDate.day);
    final snapshot = _contextEngine.buildSnapshot(
      now: now,
      upcomingEvents: state.events
          .where((event) =>
              event.startsAt.year == date.year &&
              event.startsAt.month == date.month &&
              event.startsAt.day == date.day)
          .toList(),
      memories: state.memories,
      weatherEvents: state.weatherEvents,
      routeEstimate: state.routeProfile.sampleCount > 0
          ? _routeEstimateForMemories(state.memories, now)
          : null,
      activity: ActivityState.unknown,
      activityConfidence: 0,
      activityTimestamp: now,
    );
    final result = const PlanningEngine().buildDailyPlan(
      PlanningInput(
        date: date,
        events: snapshot.upcomingEvents,
        tasks: state.tasks
            .where(
              (task) =>
                  task.deadline.year == date.year &&
                  task.deadline.month == date.month &&
                  task.deadline.day == date.day,
            )
            .toList(),
        memories: state.memories,
        preparationDuration: _preparationDuration(state.memories, now),
        travelDuration: snapshot.routeEstimate?.duration ?? Duration.zero,
        defaultBuffer: state.profile.defaultTravelBuffer,
        now: now,
        routeEstimate: snapshot.routeEstimate,
        weatherEvents: state.weatherEvents,
        weatherDecision: _relevanceEngine.evaluateWeather(snapshot),
      ),
    );
    await _store.savePlan(result.plan);
    final alarm = _alarmService.alarmForPlan(
      result.plan,
      evidence: result.evidence,
    );
    if (alarm != null) await _store.saveAlarm(alarm);
    state = state.copyWith(
      currentPlan: result.plan,
      currentEvidence: result.evidence,
      currentAlarm: alarm,
      clearCurrentAlarm: alarm == null,
      contextSnapshot: snapshot,
    );
  }

  Future<void> sendMessage(String text) async {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final reminders = await _store.readReminders();
    final snapshot = _contextEngine.buildSnapshot(
      now: now,
      upcomingEvents: state.events,
      memories: state.memories,
      weatherEvents: state.weatherEvents,
      routeEstimate: state.routeProfile.sampleCount > 0
          ? _routeEstimateForMemories(state.memories, now)
          : null,
      activity: ActivityState.stationary,
      activityConfidence: 0.8,
      activityTimestamp: now,
      tasks: state.tasks,
      plan: state.currentPlan,
      reminders: reminders,
    );
    final weatherDecision = _relevanceEngine.evaluateWeather(snapshot);
    final response = _agent.respond(
      text: text,
      planningInput: PlanningInput(
        date: DateTime(now.year, now.month, now.day + 1),
        events: state.events,
        tasks: state.tasks
            .where(
              (task) =>
                  task.deadline.year == tomorrow.year &&
                  task.deadline.month == tomorrow.month &&
                  task.deadline.day == tomorrow.day,
            )
            .toList(),
        memories: state.memories,
        preparationDuration: _preparationDuration(state.memories, now),
        travelDuration: state.routeProfile.sampleCount > 0
            ? state.routeProfile.typicalDuration
            : Duration.zero,
        defaultBuffer: state.profile.defaultTravelBuffer,
        now: now,
        routeEstimate: snapshot.routeEstimate,
        weatherEvents: state.weatherEvents,
        weatherDecision: weatherDecision,
      ),
    );
    var assistantMessage = response.message;
    if (response.planResult == null &&
        response.createdMemory == null &&
        response.message.startsWith('I can help with local planning') &&
        _groqAssistant.isConfigured) {
      try {
        final reply = await _groqAssistant.ask(
          message: text,
          context: snapshot.items
              .map((item) => <String, Object?>{
                    'id': item.id,
                    'kind': item.kind.name,
                    'summary': item.summary,
                    'source': item.source,
                    'observed_at': item.observedAt?.toIso8601String(),
                    'freshness': item.freshness.name,
                    'confidence': item.confidence,
                  })
              .toList(),
        );
        assistantMessage = reply.answer;
      } on GroqUnavailable catch (error) {
        assistantMessage = '${error.message} I did not complete an AI action.';
      }
    }
    final updatedMemories = [
      ...state.memories,
      if (response.createdMemory != null) response.createdMemory!,
    ];
    if (response.createdMemory != null) {
      await _store.saveMemory(response.createdMemory!);
    }
    final updatedRouteEstimate =
        _routeEstimateForMemories(updatedMemories, now);
    final updatedSnapshot = _contextEngine.buildSnapshot(
      now: now,
      upcomingEvents: state.events,
      memories: updatedMemories,
      weatherEvents: state.weatherEvents,
      routeEstimate:
          state.routeProfile.sampleCount > 0 ? updatedRouteEstimate : null,
      activity: ActivityState.stationary,
      activityConfidence: 0.8,
      activityTimestamp: now,
      tasks: state.tasks,
      plan: state.currentPlan,
      reminders: reminders,
    );
    final shouldReplan =
        (response.createdMemory?.condition == 'transport.tomorrow' ||
                response.createdMemory?.condition == 'preparation.duration') &&
            state.currentPlan != null;
    final replanned = shouldReplan
        ? const PlanningEngine()
            .buildDailyPlan(
              PlanningInput(
                date: DateTime(now.year, now.month, now.day + 1),
                events: state.events,
                tasks: state.tasks
                    .where(
                      (task) =>
                          task.deadline.year == tomorrow.year &&
                          task.deadline.month == tomorrow.month &&
                          task.deadline.day == tomorrow.day,
                    )
                    .toList(),
                memories: updatedMemories,
                preparationDuration: _preparationDuration(updatedMemories, now),
                travelDuration:
                    updatedSnapshot.routeEstimate?.duration ?? Duration.zero,
                defaultBuffer: state.profile.defaultTravelBuffer,
                now: now,
                routeEstimate: updatedSnapshot.routeEstimate,
                weatherEvents: state.weatherEvents,
                weatherDecision:
                    _relevanceEngine.evaluateWeather(updatedSnapshot),
              ),
            )
            .plan
        : null;
    final plan = response.planResult?.plan ?? replanned ?? state.currentPlan;
    final evidence = response.planResult?.evidence ?? state.currentEvidence;
    if (plan != null &&
        response.createdMemory?.condition == 'preparation.duration' &&
        state.currentPlan != null &&
        updatedSnapshot.routeEstimate == null) {
      final event = updatedSnapshot.upcomingEvents
          .where((item) => item.startsAt.isAfter(now))
          .toList()
        ..sort((a, b) => a.startsAt.compareTo(b.startsAt));
      if (event.isNotEmpty) {
        final wakeAt = event.first.startsAt
            .subtract(_preparationDuration(updatedMemories, now));
        final existing = plan.blocks
            .where((block) =>
                block.type != PlanBlockType.wake &&
                block.type != PlanBlockType.preparation)
            .toList();
        final replannedWithoutRoute = DailyPlan(
          id: plan.id,
          date: plan.date,
          blocks: [
            PlanBlock(
              id: 'wake-${event.first.id}',
              type: PlanBlockType.wake,
              title: 'Wake',
              startsAt: wakeAt,
              endsAt: wakeAt,
              evidenceIds: const ['evidence-preparation'],
            ),
            PlanBlock(
              id: 'prep-${event.first.id}',
              type: PlanBlockType.preparation,
              title: 'Preparation',
              startsAt: wakeAt,
              endsAt: event.first.startsAt,
              evidenceIds: const ['evidence-preparation'],
            ),
            ...existing,
          ]..sort((a, b) => a.startsAt.compareTo(b.startsAt)),
          evidenceIds: plan.evidenceIds,
          createdAt: plan.createdAt,
          updatedAt: now,
        );
        await _store.savePlan(replannedWithoutRoute);
        final alarm = _alarmService.alarmForPlan(replannedWithoutRoute);
        if (alarm != null) await _store.saveAlarm(alarm);
        state = state.copyWith(
          messages: [
            ...state.messages,
            'You: $text',
            'NIVA: $assistantMessage',
          ],
          memories: updatedMemories,
          routeEstimate: updatedRouteEstimate,
          contextSnapshot: updatedSnapshot,
          currentPlan: replannedWithoutRoute,
          currentEvidence: [
            Evidence(
              id: 'evidence-preparation',
              source: EvidenceSource.computed,
              summary:
                  'Preparation duration ${_preparationDuration(updatedMemories, now).inMinutes} min, from explicit user correction.',
              timestamp: now,
              confidence: 1,
            ),
          ],
          currentAlarm: alarm,
          clearCurrentAlarm: alarm == null,
        );
        await _reconcileReminders();
        return;
      }
    }
    if (plan != null && (response.planResult != null || replanned != null)) {
      await _store.savePlan(plan);
    }
    final alarm = plan == null
        ? state.currentAlarm
        : _alarmService.alarmForPlan(plan, evidence: evidence);
    if (alarm != null && (response.planResult != null || replanned != null)) {
      await _store.saveAlarm(alarm);
    }

    state = state.copyWith(
      messages: [
        ...state.messages,
        'You: $text',
        'NIVA: $assistantMessage',
      ],
      memories: updatedMemories,
      routeEstimate: updatedRouteEstimate,
      contextSnapshot: updatedSnapshot,
      currentPlan: plan,
      currentEvidence: evidence,
      currentAlarm: alarm,
      clearCurrentAlarm:
          alarm == null && (response.planResult != null || replanned != null),
    );
    if (plan != null && (response.planResult != null || replanned != null)) {
      await _reconcileReminders();
    }
  }

  Future<void> forgetMemory(String id) async {
    await _store.deleteMemory(id);
    final updatedMemories =
        state.memories.where((memory) => memory.id != id).toList();
    final now = DateTime.now();
    state = state.copyWith(
      memories: updatedMemories,
      contextSnapshot: _contextEngine.buildSnapshot(
        now: now,
        upcomingEvents: state.events,
        memories: updatedMemories,
        weatherEvents: state.weatherEvents,
        routeEstimate: state.routeProfile.sampleCount > 0
            ? _routeEstimateForMemories(updatedMemories, now)
            : null,
        activity: ActivityState.stationary,
        activityConfidence: 0.8,
        activityTimestamp: now,
      ),
    );
  }

  Future<void> cancelAlarm() async {
    final alarm = state.currentAlarm;
    if (alarm == null || !alarm.isActive) return;
    final cancelled = AdaptiveAlarm(
      id: alarm.id,
      scheduledFor: alarm.scheduledFor,
      reason: alarm.reason,
      evidenceIds: alarm.evidenceIds,
      calculationVersion: alarm.calculationVersion,
      isActive: false,
    );
    await _store.saveAlarm(cancelled);
    state = state.copyWith(clearCurrentAlarm: true);
  }

  Future<ReminderPermission> requestReminderPermission() async {
    final result = await _reminderScheduler.requestPermission();
    state = state.copyWith(reminderPermission: result);
    return result;
  }

  Future<void> refreshReminderPermission() async {
    state = state.copyWith(
      reminderPermission: await _reminderScheduler.permission,
    );
  }

  Future<void> reconcileReminders() => _reconcileReminders();

  Future<void> _reconcileReminders() async {
    try {
      await _reminderScheduler.reconcile(
        tasks: state.tasks,
        events: state.events,
        plan: state.currentPlan,
      );
      state = state.copyWith(
        reminderPermission: await _reminderScheduler.permission,
      );
    } catch (_) {
      // Notification capability failures must not interrupt local planning.
      state = state.copyWith(
        reminderPermission: ReminderPermission.unavailable,
      );
    }
  }

  RouteEstimate _routeEstimateForMemories(List<Memory> memories, DateTime now) {
    if (state.routeProfile.sampleCount == 0) {
      return RouteEstimate(
        routeProfileId: state.routeProfile.id,
        duration: Duration.zero,
        normalDuration: Duration.zero,
        source: 'unavailable',
        fetchedAt: now,
      );
    }
    return RouteEstimate(
      routeProfileId: state.routeProfile.id,
      duration: state.routeProfile.typicalDuration,
      normalDuration: state.routeProfile.typicalDuration,
      source: 'local_route_memory',
      fetchedAt: now,
    );
  }

  Duration _preparationDuration(List<Memory> memories, DateTime now) {
    final preparation = _memoryService.highestPriorityMemory(
      memories,
      condition: 'preparation.duration',
      now: now,
    );
    final minutes = int.tryParse(
      preparation?.value.replaceAll(RegExp(r'[^0-9]'), '') ?? '',
    );
    return Duration(minutes: minutes != null && minutes > 0 ? minutes : 48);
  }

  static AdaptiveAlarm? _firstActiveAlarm(List<AdaptiveAlarm> alarms) {
    for (final alarm in alarms) {
      if (alarm.isActive) {
        return alarm;
      }
    }
    return null;
  }
}

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

final localStoreProvider = Provider<LocalStore>((ref) {
  return DriftLocalStore(ref.watch(appDatabaseProvider));
});

final appStateProvider =
    StateNotifierProvider<AppStateController, AppState>((ref) {
  return AppStateController(ref.watch(localStoreProvider));
});
