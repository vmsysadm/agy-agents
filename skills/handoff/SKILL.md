---
name: handoff
description: Use this skill when the user types /handoff or asks to summarize the session into a handoff.md file for the next agent session.
---

# Session Handoff Workflow

Perform the steps below to summarize the session state into a single `handoff.md` file.

## Operational Rules

1. **Epistemic Honesty and Root-Cause Discipline**:
   - NEVER state or assume you found a root cause unless experimentally confirmed (for example, with a reproduced test and verified fix).
   - Record all paths and files explored during the session.
   - Label working theories strictly as unconfirmed suspicions or hypotheses.
   - Document ruled-out hypotheses with the reason why they failed.
   - List all unexplored avenues for the next agent to evaluate.

2. **Clickable File Links**:
   - Format all file references as clickable links using `[basename](file:///absolute/path)`.

## Instructions

1. Inspect the workspace state:
   - Identify all completed actions and file changes (`git status`, modified files).
   - List all tested hypotheses, experimental results, and unconfirmed theories.
   - Identify unresolved blockers, edge cases, and remaining tasks.

2. Write or overwrite `handoff.md` in the root of the active workspace.

3. Use this standard structure:

```markdown
# Session Handoff

## 1. Goal and Objectives
- **Primary Goal**: <Main goal of the task>
- **Session Scope**: <Scope of work addressed in this session>

## 2. Completed Work
- [x] <Completed item: short summary and modified files>
- [x] <Completed item: short summary and modified files>

## 3. Investigation & Diagnostic State
> [!NOTE]
> Hypotheses are only factual when experimentally confirmed.

### A. Confirmed Facts & Experimental Evidence
- <Fact with verified reproduction/test result>

### B. Explored Paths & Ruled-Out Hypotheses
- <Path or hypothesis tested and found incorrect, with explanation>

### C. Working Suspicions (Unconfirmed)
- <Suspicion or hypothesis not yet verified by experiment>

### D. Unexplored Avenues
- <Potential path, file, or component worth investigating next>

## 4. Current Workspace State & Key Files
- **Active Branch / Directory**: <Branch name and working path>
- **Modified / Critical Files**:
  - [`filename`](file:///absolute/path/to/filename) — <Status and purpose>

## 5. Verification Commands
```bash
<Exact commands to run tests, build, or verify the system>
```

## 6. Next Steps & Guidance for Incoming Agent
1. [ ] <First immediate action to take>
2. [ ] <Subsequent task or verification step>
- **Important Guidance / Pitfalls**: <Known gotchas, constraints, or behavioral rules>
```

4. Show a concise summary to the user with a clickable link to the generated `handoff.md` file.
