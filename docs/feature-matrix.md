# NIVA Feature Matrix

Status definitions follow the master engineering directive. `VERIFIED` is scoped to the stated evidence and does not imply production readiness.

| Capability | Status | Evidence and remaining acceptance work |
|---|---|---|
| Local tasks, deadlines, priorities, and deterministic plan slots | VERIFIED | Flutter unit/widget tests cover persisted task planning and conflicts; availability only includes entered commitments and the documented planning-day default. |
| Drift persistence and migrations | VERIFIED | Automated migration and store tests pass; production backup/restore and data-retention behavior need review. |
| General context normalization and evidence-aware relevance | VERIFIED | Deterministic tests cover source, freshness, missing inputs, conflicts, expiry, scoring, and deduplication. Live integrations remain absent. |
| Groq conversational/tool-selection boundary | PARTIAL | Flutter/backend mocked tests pass; key stays server-side and tool actions are constrained. No live authenticated request, account authorization, hosted production backend, abuse controls, or operations have been verified. |
| Android local reminder scheduling and reconciliation | IMPLEMENTED_UNVERIFIED | Scheduler, stable IDs, metadata, permission states, restart reconciliation, and plugin boot configuration are covered by tests. No device/emulator delivery or reboot test has occurred. |
| Android startup activity resolution | VERIFIED | Manifest now names `com.example.niva_mobile.MainActivity`, matching the Kotlin declaration; application ID remains `com.niva.mobile`. Fresh APK and merged-manifest verification are part of this reconciliation run. Device launch remains unverified unless physically performed. |
| Weather, traffic, and routing providers | SCAFFOLDED | Models/service boundaries and deterministic relevance exist; provider credentials/data, freshness, and end-to-end behavior are not integrated. |
| Calendar synchronization and Gmail interview extraction | NOT_IMPLEMENTED | Manual appointments are supported; OAuth/provider sync is deferred. |
| Production identity, authorization, and private durable audit | NOT_IMPLEMENTED | Local development boundary only; no production user accounts or authorization system. |
| Release signing and production distribution | BLOCKED | Release signing is intentionally guarded and no owner keystore/secrets are configured. Debug APK is separate. |
| Device behavior on vivo Y16 / Android 12 | BLOCKED | No successful launch evidence or connected device session is available in this run; owner/device test required. |
