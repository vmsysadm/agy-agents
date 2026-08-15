---
name: handoff
description: Use this skill when the user types /handoff or asks to summarize the session into a handoff.md file for the next agent session.
---

Perform the steps below to summarize the session state into a single `handoff-<short-desctiptive-name>.md` file.

Rules:

1. Epistemic Honesty and Root-Cause Discipline:
   - NEVER state or assume you found a root cause unless experimentally confirmed (for example, with a reproduced test and verified fix).
   - Record all paths and files explored during the session.
   - Label working theories strictly as unconfirmed suspicions or hypotheses.
   - Document ruled-out hypotheses with the reason why they failed.
   - List all unexplored avenues for the next agent to evaluate.

Instructions:

1. Inspect the context state:
   - Identify all completed actions. 
   - List all tested hypotheses, experimental results, and unconfirmed theories.
   - Identify unresolved blockers, edge cases, and remaining tasks.

2. Write or overwrite `handoff-<short-desctiptive-name>.md` in the root of the active workspace.

Add Next Steps & Guidance for Incoming Agent:
    - Important guidance, pitfalls, known gotchas, constraints, or behavioral rules defined by the user in the previous session

Show a concise summary to the user with a clickable link to the generated file.
