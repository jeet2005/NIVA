# Architecture

NIVA is organized as a local-first Flutter application. The FastAPI backend is a constrained, optional Groq boundary; the Flutter app remains the source of truth.

The Phase 1 mobile app separates:

- `app`: routing and state composition
- `models`: typed domain records
- `planning`: deterministic plan generation
- `planner_task`: local task inputs with deadline, duration, priority, and completion state
- `memory`: memory priority and correction behavior
- `notifications`: priority and deduplication decisions
- `calendar`: calendar service interface with manual local implementation
- `weather`: weather service boundary; no live provider is configured
- `routing`: route memory and routing service interfaces
- `context`: context snapshot and relevance decisions
- `agents`: deterministic local conversation flows and the Groq-only backend client
- `storage`: local persistence interface with Drift/SQLite and in-memory test implementations
- `features`: presentation screens

The LLM is not an architectural source of truth. Groq can select only typed, allowlisted tools. Current context/task/plan tools are read-only; replan returns an unexecuted proposal requiring local validation and user confirmation. No tool runs arbitrary code or writes directly to Drift. The Groq key exists only in the backend environment. The backend is local-development-only until user authentication, authorization, abuse limits, secure hosting, and retention controls are added.

Manual tasks and reminders are persisted in Drift/SQLite. Planning, reminder arithmetic, memory precedence, permissions, and evidence authority remain deterministic and offline. Context facts carry provenance and freshness, and missing inputs stay explicit unknowns. Live OAuth, device location, weather and routing APIs remain unimplemented. Android local notifications are implemented but device delivery/background behavior has not been tested in this environment. The application must label sample route estimates and avoid treating them as learned user behavior.
