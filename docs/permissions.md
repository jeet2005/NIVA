# Permissions

Phase 1 does not request platform permissions yet.

Phase 2-4 source adds service boundaries for calendar, weather, route, and context logic, but still does not request platform permissions or connect live accounts.

Future permission flows must be progressive:

- explain why the permission helps before requesting it
- allow denial without making the app unusable
- let the user enable integrations later
- keep notification, location, calendar, Gmail, and motion controls independent
