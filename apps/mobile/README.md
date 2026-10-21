# NIVA Mobile

Android-first Flutter client for NIVA.

## Development

```powershell
flutter pub get
flutter analyze
flutter test
flutter build apk --release
```

## Current Scope

This app currently includes the local-first foundation, deterministic planner,
adaptive alarm calculation, route memory logic, context relevance decisions, and
manual tasks with local persistence, deadline/priority-aware slot proposals,
completion state, and explicit conflicts. First launch has no fabricated
calendar events or weather. The starter route profile is marked as sample
configuration and has zero observed samples. Proposed task slots start at
09:00 and account only for commitments the user entered. Users can also set an
explicit not-before time for a task.

Live calendar OAuth, weather, route, location, Gmail, and Groq integrations are
not connected yet. Flutter 3.47.6 is available with scoped SDK access; dependency
resolution succeeded, analysis reports no issues, and all 30 tests pass. Android
SDK platform 35, Build-Tools 35.0.1, NDK 28.2.13676358, and CMake 3.22.1 are
installed. A fresh debug-signed APK builds and verifies for local testing.
Release compilation reaches the intentional signing guard, but no release
credentials are configured and no fresh release APK is produced. Configure
release secrets locally or in CI before creating a signed release artifact.
