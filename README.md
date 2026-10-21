# NIVA

NIVA is a local-first personal context, memory, and planning engine for Android, built with Flutter.

Tagline: "Your day, looked after."

## Current Phase

This checkout is a local-first prototype, not a complete MVP. Implemented source includes:

The current general-context/Groq milestone and limitations are tracked in [`docs/acceptance-status.md`](docs/acceptance-status.md), with backend setup in [`docs/context-engine.md`](docs/context-engine.md). Groq is integrated only through the backend boundary; no live API key or production deployment is configured.

- Flutter app structure and Material 3 shell
- central branding configuration
- user profile, memory, daily plan, alarm, notification, and evidence models
- deterministic daily planning engine
- local task entry/persistence, priority-aware slot proposals, explicit user-directed rescheduling, and conflict reporting
- memory priority and correction handling
- notification priority/deduplication logic
- mocked conversation agent for deterministic local flows
- calendar service boundary (no events are fabricated on first launch)
- weather service boundary (weather is unavailable until a source is connected)
- context and relevance engines
- adaptive alarm calculation from generated plans
- route memory profiles and route observation aggregation
- unit tests for planning, memory, and notification behavior

External integrations such as live Calendar OAuth, live Weather APIs, Location permission, Gmail, traffic providers, and motion sensors are not connected. The starter route profile is sample configuration with zero observed samples; it is displayed as a local estimate and must not be described as a learned user routine.

## Repository Layout

```text
niva/
  apps/mobile/     Flutter Android-first app
  backend/         FastAPI boundary for server-side Groq calls
  ml/              Future experiments and exports
  docs/            Architecture and product documentation
```

## Environment

Create a local `.env` from `.env.example` when integrations are added. Never commit real secrets.

## Development

Expected mobile commands once Flutter is installed:

```bash
cd apps/mobile
flutter pub get
flutter analyze
flutter test
flutter build apk --release
```

Flutter is installed at `D:\flutter\bin`. Current verified commands and milestone limitations are recorded in `docs/acceptance-status.md`.

## Milestone Status (2026-10-22)

Implemented source includes Drift-backed local planning/tasks/memories, Android local reminders, a normalized general-purpose context engine, deterministic candidate relevance, and a Groq-only FastAPI boundary with typed read-only tools and proposal-only replanning. Groq remains optional at runtime so supported local flows work offline.

**PARTIAL — NOT PRODUCTION READY.** Latest verified checks: `flutter pub get`, `flutter analyze`, 43 Flutter tests, 7 backend unit tests, and a fresh debug APK signed with the Android debug certificate. No authenticated live Groq request, deployed backend, account authorization, Android device reminder delivery, or release signing was verified. See [`docs/acceptance-status.md`](docs/acceptance-status.md) for the full evidence and blockers. Do not put server credentials in Flutter or expose the development backend publicly.
