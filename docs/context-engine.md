# General-purpose context engine and Groq boundary

## Local authority

The Flutter app remains useful offline. `ContextEngine` normalizes local events, pending tasks, non-expired memories, weather, route estimates, activity, the current plan, and pending reminders into `ContextItem` facts. Each fact carries a stable reference, source, observation time, freshness, and (when meaningful) confidence. Missing calendar/weather/route inputs are exposed as unknowns; expired memories are excluded; conflicting active memories on the same condition are surfaced without changing the deterministic memory precedence service. `RelevanceEngine.evaluateCandidate` requires current evidence, applies the candidate's priority/confidence, ignores expired candidates, and suppresses same-domain duplicates. Existing schedule arithmetic, memory precedence, reminder state, and Drift persistence remain deterministic app concerns.

## Groq backend

Groq is the only conversational LLM provider. The Flutter app has no Groq key; it sends a bounded request to `NIVA_BACKEND_URL`. When the backend URL is absent, supported local MockAgent actions continue to work offline and unsupported requests get the existing explicit limitation response. If a configured backend fails, the user sees an error instead of a fabricated AI response.

Backend setup (Python 3.11+):

```powershell
cd backend
python -m venv .venv
.venv\Scripts\Activate.ps1
pip install -r requirements.txt
$env:GROQ_API_KEY = 'your key, stored only in this backend process'
$env:GROQ_MODEL = 'openai/gpt-oss-20b'
uvicorn app.main:app --host 127.0.0.1 --port 8000
```

The Flutter dev build can use `--dart-define=NIVA_BACKEND_URL=https://your-trusted-backend.example`. The backend endpoint currently accepts loopback requests by default; an optional `NIVA_DEV_TOKEN` can authorize a local development client from another host. Do not expose this unauthenticated development service to the public internet. A real deployment needs user authentication, authorization, abuse/rate limiting, transport security, retention policy, and operational monitoring first. Do not ship a Groq key or the development token in a public APK. The Android app keeps cleartext HTTP disabled.

The API sends only the current user message and the normalized context facts. Old conversation turns are not retained or transmitted. Text/context are untrusted data. Groq can call only `get_today_context`, `list_tasks`, `get_plan`, and `request_replan`; arguments are validated against explicit allowlists. The first three are read-only. `request_replan` returns a proposal with `executed: false` and asks for confirmation; it does not modify the plan. There is no arbitrary command execution or direct database access. A later app action must independently validate proposals against deterministic planner rules.

Requests have a 12-second backend timeout, payload and output bounds, no automatic retry, and at most two Groq calls for one bounded tool round. HTTP 429, authentication, network, malformed output, missing key, and invalid tool cases return explicit failures. Tool responses carry evidence IDs for current supplied facts; the API does not claim delivery/execution or persist user conversation text.

## Model and cost notes

Default model is configurable with `GROQ_MODEL` and currently set to `openai/gpt-oss-20b`; this was a supported tool-use model in the official Groq model catalog checked on 2026-10-22. Availability, model names, rate limits, pricing, and free/developer plan terms can change. The current Free plan is for build/test and is not a promise of perpetual free production service. Confirm the account's current limits and terms before deployment. See [Groq Models](https://console.groq.com/docs/models), [Tool Use](https://console.groq.com/docs/tool-use/local-tool-calling), and [Rate Limits](https://console.groq.com/docs/rate-limits).

No live authenticated API request has been made for this milestone because no server key was provided. Automated backend tests mock/fail closed at the Groq boundary; they do not prove live Groq availability.
