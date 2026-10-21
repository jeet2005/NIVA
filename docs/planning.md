# Planning

The planning engine is deterministic. Given calendar events, preparation duration, travel duration, and a buffer, it calculates:

- wake time
- preparation block
- departure time
- travel block
- event blocks

Basic time arithmetic is covered by unit tests and does not depend on an LLM.

## General-purpose context and Groq

`ContextEngine` now normalizes locally persisted events, pending tasks, active memories, weather, route estimates, activity, plans, and pending reminders as sourced context facts. Facts carry an ID, source, observation time, freshness, and confidence. Missing sources are listed as unknown; expired memories are excluded; conflicts among active memories with the same condition are surfaced without changing `MemoryService` precedence. The generic relevance entry point requires current evidence, uses deterministic confidence/priority scoring, expires old candidates, and deduplicates similar candidates within a domain and time window.

Groq is the only conversational model provider and is called through `backend/app/main.py`; the Flutter app contains no provider key. The backend accepts a bounded context and message, offers a small strict tool allowlist, and can only propose replanning for later local validation/confirmation. It has no direct database write path. Unsupported local requests use Groq only when `NIVA_BACKEND_URL` is configured; missing/unavailable Groq is reported explicitly, while known local planner operations continue to work offline. See `docs/context-engine.md` for setup and deployment limits.

This milestone has deterministic Flutter tests and backend tests against mocked HTTP behavior. No real authenticated Groq request or production backend has been verified. The local FastAPI boundary is not production-deployable until authentication, user-level authorization, abuse controls, secure hosting, retention policy, and monitored operations are added. Free-tier quotas and model availability can change; verify current Groq terms before use.

Future phases should add route profiles, weather relevance, traffic deltas, localized replanning, and adaptive alarms backed by evidence records.

## Phase 2-4 Additions

The planner now accepts route estimates and weather relevance decisions. If a route estimate is available, it replaces the generic travel duration. Adaptive alarms are derived from the wake block and retain evidence IDs from the plan.

The context/relevance layer evaluates weather and traffic before planner changes are made. Rain with no travel is ignored. Rain with active car context is observed without unnecessary rescheduling. Traffic delays can recommend rescheduling when the user has not already departed.

## General task planning

Manual tasks persist locally with estimated duration, deadline, priority, and completion state. The deterministic planner places pending tasks around recorded calendar events, travel, and preparation blocks, then reports an explicit deadline conflict if no slot fits. Proposed slots begin at 09:00 local time unless the current time or the user's explicit not-before time is later. Only entered fixed commitments are considered; unrecorded obligations and actual user availability are unknown. Task plans and task evidence are restored from local persistence. Task rescheduling through conversation is not implemented.

## Android local reminders

Tasks and appointments now produce local Android reminder requests through `flutter_local_notifications`. Pending tasks get a reminder 10 minutes before a future planned task block and another 15 minutes before the deadline; future appointments get a reminder 15 minutes before start. Each reminder has a stable key-derived notification ID, persisted schedule/content/evidence/status metadata, and an audit entry for schedule, reschedule, permission deferral, or cancellation. Schema version 3 migrates existing version 2 data without dropping prior task/planning state.

Reconciliation runs on startup, after task/appointment/plan changes, and when the app resumes. It compares desired local state with Android's pending notification IDs, repairs missing platform requests, cancels obsolete requests, and avoids duplicate requests by stable ID. Completed tasks and deleted/elapsed appointments cease being desired reminders. Notification permission is requested only after the user action in Settings. A denied or unavailable permission does not block offline planning. The app uses inexact allow-while-idle scheduling and does not request exact-alarm access; Android may delay delivery. Android's notification permission and boot receiver are configured so the plugin can request notification access and restore schedules after reboot/package replacement.

Reminder times are persisted as instants and scheduled in UTC. Returning to the app reconciles pending requests after system changes. This preserves the instant represented by existing stored event/task dates; it does not reinterpret appointments as new local wall-clock times after a timezone change. Actual grant/deny dialog behavior, notification delivery/cancellation, app restart, reboot, time changes, and OEM background restrictions have not been device-tested. `flutter test` covers reminder calculation, modification, cancellation, deduplication, restart reconciliation, permission denial/revocation, and obsolete reminders; these automated tests do not establish background delivery.
