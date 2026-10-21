# Repository Reconciliation

Updated 2026-10-22.

## Canonical checkout

- Path: `D:\NIVA\NIVA-github`
- Branch: `feat/general-context-engine`
- Baseline commit: `92b49c0` (`Implement general context engine and Groq boundary`)
- Remote: `https://github.com/jeet2005/NIVA.git`
- Recovery: preserve the complete older working copy at `D:\NIVA\niva`; do not delete or overwrite it. The canonical Git commit above is also a recoverable source snapshot.

The canonical branch was clean at inspection and tracked `origin/feat/general-context-engine`. It contains the newer general context engine, Groq FastAPI boundary, local reminder work, and associated Flutter/backend tests and documentation.

## Older copy and integration

`D:\NIVA\niva` has no `.git` directory or readable Git history, so no branch or commit SHA can be attributed to it. Its project files were inspected directly. The Kotlin activity in both copies declares `com.example.niva_mobile.MainActivity`; Gradle keeps both namespace and application ID at `com.niva.mobile`. The older manifest had the explicit class name, while the canonical manifest used `.MainActivity`, which resolved to the wrong package and caused the reported class-not-found crash. The exact manifest entry was changed to `com.example.niva_mobile.MainActivity` in the canonical checkout.

No other old-copy code was imported. Generated build outputs were excluded. No reset, clean, force push, or deletion was performed.

## Verification record

The verification record for this reconciliation is in [acceptance-status.md](acceptance-status.md). Device launch and real notification behavior must remain unverified until tested on Android hardware or an emulator.

The configured API 37 emulator process did start during this session, but ADB kept its transport offline after server restart and boot wait. No APK installation or runtime launch was possible. The older vivo Y16 was not connected. The failed emulator attempt is recorded as an environment blocker, not a passing startup test.
