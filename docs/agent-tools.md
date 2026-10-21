# Agent Tools

Phase 1 includes a mocked agent boundary for local conversation demos. It can:

- trigger `buildDailyPlan`
- create temporary transport context
- record a preparation-time correction
- recalculate the active plan after temporary transport context changes

Future Groq integration must expose typed tools only, reject malformed arguments, log tool calls in development mode, and never allow arbitrary code execution.

Required future tools include:

- `get_current_context`
- `get_calendar_events`
- `get_weather`
- `get_route`
- `get_route_history`
- `get_user_preferences`
- `get_temporary_context`
- `get_observed_patterns`
- `estimate_travel_time`
- `calculate_wake_time`
- `build_daily_plan`
- `remember_preference`
- `remember_temporary_context`
- `record_user_correction`
