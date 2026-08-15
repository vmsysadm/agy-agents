---
name: handoff
description: Use this skill when the user types /handoff or asks to summarize the session into a handoff file for the next agent session.
---

Perform the steps below to summarize the session state into a single `handoff-<short-descriptive-name>.md` file in the root of the active workspace.

Rules:

1. Epistemic Honesty and Root-Cause Discipline:
   - Do not state or assume a root cause unless experimentally confirmed.
   - List all discovered evidence.
   - Record all paths, API endpoints, and files explored during the session.
   - Label working theories strictly as unconfirmed hypotheses.
   - Document ruled-out hypotheses with the reason why they failed.
   - List all unexplored avenues for the next agent to evaluate.

2. Strict Task Scoping (Eliminate Noise and Echoes):
   - Exclude global system instructions, permanent user rules, and general subagent policies. The incoming agent already has access to them.
   - Exclude internal agent tool mechanics (for example: failed tool calls, API parameter adjustments, or internal agent workflows) unless the session task is explicitly about debugging agent tools.
   - Focus exclusively on the problem domain, code modifications, system behavior, and domain-specific evidence.

3. Formatting and Readability:
   - Avoid excessive markup formatting (for example: nested tables, decorative badges, complex diagrams).
   - Prioritize clean, human-readable plain text over nested elements.
   - Describe code and infrastructure operations using plain language.
   - Follow ASD-STE100 Simplified Technical English.

Structure of the Handoff Document:

The generated `handoff-<short-descriptive-name>.md` must follow this 4-part structure:

1. Problem Statement:
   - Exactly two paragraphs.
   - Paragraph 1: Describe the primary domain problem we are trying to solve and the main focus of the session.
   - Paragraph 2: Describe current operational status, target outcome, and core domain challenges.

2. Narrative:
   - Chronological sequence of engineering actions and decisions in the codebase.
   - Use the pattern: "First, we tried [action] with [result]. Then, we tried [action] with [result]..."
   - Detail what was attempted in the domain and what was learned from the outcome.
   - Do not include internal agent tool execution steps or tool syntax retries.

3. Supporting Evidence Narrative:
   - Narrative of domain empirical data, benchmark observations, test logs, error traces, and code findings.
   - Detail confirmed technical facts versus disproven assumptions in the codebase.
   - Reference exact application error messages and test outputs.

4. Technical Details for Incoming Agent:
   - Deep technical dive on Sections 1, 2, and 3.
   - Specific file paths, line ranges, environment configurations, and architectural dependencies of the project.
   - Active task-specific hypotheses and recommended verification commands/tests.
   - Direct, actionable next steps for the incoming agent on this specific task.
   - Do NOT restate global agent rules or general prompt guidelines.

Instructions:

1. Inspect the context state:
   - Identify all completed domain and engineering actions.
   - List all tested hypotheses, experimental results, and unconfirmed theories.
   - Identify unresolved blockers, edge cases, and remaining tasks.

2. Write or overwrite `handoff-<short-descriptive-name>.md` in the root of the active workspace with the 4-part structure.

3. Show a concise summary to the user with a clickable link to the generated file.
