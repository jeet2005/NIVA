# Memory

Phase 1 implements the core memory types in code:

- explicit preferences
- temporary context
- observed patterns

Priority order:

1. explicit current instruction
2. explicit permanent preference
3. temporary context
4. strong observed pattern
5. weak inferred pattern

The current `MemoryService` implements active-memory filtering, expiration, and explicit correction creation. Persistent SQLite storage is still required before the local-storage acceptance criteria can pass.
