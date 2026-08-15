# AGY Custom Agents

Custom specialist agent definitions and global rules for Google Antigravity (`agy`) CLI.

## Agents Included

- **`git_operator`**: Executes Git repository operations using `gemini-3.7-flash-low` (ephemeral per task).
- **`coder`**: Authors scripts with dedicated logging, complex logic, and produces Change Impact Matrices in DRY-RUN mode using `gemini-3.7-flash-medium` (persistent per session).

## Skills Included

- **`handoff`**: Summarizes session state into a structured `handoff.md` file with strict epistemic standards for diagnostic investigations, root cause assertions, and handoff reporting.

## Installation

### PowerShell (Windows)

Run the installation script:

```powershell
.\install.ps1
```

### Bash (macOS / Linux)

Run the shell script:

```bash
./install.sh
```

## Global Multi-Agent Rules (`~/.gemini/GEMINI.md`)

```markdown
- Use ASD-STE100 Simplified Technical English.
- For all Git tasks, repository operations, and commands such as "commit and push", delegate execution to a subagent using invoke_subagent with Model set to "flash_lite" (Gemini 3.7 Flash Low). Git subagents are ephemeral and do not need to be persistent. Define the subagent with tools to run commands if it is not already defined.
- For complex coding and infrastructure scripting tasks, invoke the "coder" subagent with Model set to "flash" (Gemini 3.7 Flash Medium) in DRY-RUN mode. The coder writes the script and log configuration directly to disk, returning only the script path, log path, and Change Impact Matrix. Present the impact matrix to the user for confirmation. Execute the script directly in the Main Agent only after user approval. If execution fails, send the error trace back to the coder via send_message so it can inspect the logs, diagnose, and remediate.
- Maintain a persistent "coder" subagent instance: When the "coder" subagent has already been invoked in the session, reuse its active conversationID via send_message for all follow-up tasks and script iterations instead of spawning a new instance.
- Whenever you invoke a subagent, immediately output the full path to its transcript log file (~/.gemini/antigravity-cli/brain/<conversation-id>/.system_generated/logs/transcript_full.jsonl) so the user can inspect or tail it.
```
