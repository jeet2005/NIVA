# NIVA Roadmap

Roadmap items are ordered by product dependency and operational risk. Completion requires the evidence named in each milestone.

## M0 — Canonical repository and reproducible baseline

- [x] Select the newer GitHub checkout with general-context/Groq work as canonical.
- [x] Integrate the older copy's verified Android activity-name correction after comparing the exact files.
- [x] Re-run Flutter analyze/tests, backend tests, and a fresh debug build in canonical checkout.
- [x] Verify APK signature, embedded activity class, and merged manifest; exact results are in `docs/acceptance-status.md`.

## M1 — Android startup and reminder device validation

- [ ] Install the fresh debug APK on the vivo Y16 (Android 12) or emulator and verify successful launch. Attempted the configured API 37 emulator on 2026-10-22; its ADB transport remained `offline`, so install/launch could not be attempted. The vivo Y16 was not connected.
- [ ] Verify notification permission grant/denial, delivery, edit/reschedule, completion/deletion cancellation, restart, reboot, timezone/time changes, and OEM battery behavior on device.
- [ ] Adjust implementation only from observed failures; preserve inexact scheduling and truthful delivery status.

## M2 — Local-first reliability and privacy

- [ ] Define backup/export, retention, deletion, and migration recovery behavior for local records.
- [ ] Add observable, privacy-minimized diagnostics for local failures without storing conversation text unnecessarily.
- [ ] Validate accessibility, localization, and low-resource Android behavior.

## M3 — Safe authenticated Groq service

- [ ] Design user identity, per-user authorization, rate/abuse limits, secret rotation, HTTPS deployment, retention, and operational monitoring.
- [ ] Verify a real authenticated Groq request with an owner-provided server-side key; never place credentials in the app or repository.
- [ ] Verify current model support and provider terms at deployment time; do not assume free quotas are permanent.

## M4 — External context integrations

- [ ] Implement calendar access and explicit consent/revocation, then validate sync and stale-data behavior.
- [ ] Select providers and implement weather and route/traffic data with freshness, unknown-state handling, and deterministic planner validation.
- [ ] Defer Gmail and motion/location sensing until consent, retention, and acceptance criteria are specified.

## M5 — Proactive coordination and production release

- [ ] Add low-noise candidate ranking, quiet hours, user controls, and evidence-verified outcomes.
- [ ] Complete device/OEM reliability acceptance and production identity/authorization review.
- [ ] Configure owner-controlled release signing in a secure local or CI secret store and verify a signed release artifact.
- [ ] Complete operational readiness, privacy review, and release acceptance before calling NIVA production ready.
