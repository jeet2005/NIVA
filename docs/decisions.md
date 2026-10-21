# Decisions

## Phase 1 Scope

The repository was empty when Phase 1 started, and Flutter was not available on PATH. The initial implementation therefore creates the project source, architecture, deterministic domain services, tests, and documentation, but cannot verify with Flutter commands in this environment.

## No Fake Integrations

Calendar, weather, location, traffic, Gmail, and Groq are represented only as future integration boundaries. The current demo data is local application state, not a fabricated external integration.

## Storage Boundary Before Drift

Phase 1 introduces `LocalStore` and an in-memory implementation so domain code can depend on a persistence contract. A real Drift/SQLite implementation is still required before restart persistence can pass.

## Manual Providers Before Live Integrations

Phase 2-4 add calendar, weather, and routing interfaces with manual or simulated implementations. This lets the planner and relevance engine be tested without pretending OAuth, location, traffic, or weather providers are connected.

## Route Memory Uses Derived Data

Route memory stores route profiles and observations such as duration, transport, source, and timestamp. It avoids raw GPS history and calculates typical duration and variance from observations.
