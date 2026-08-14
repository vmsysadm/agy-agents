# AGY Custom Agents

Custom specialist agent definitions and global rules for Google Antigravity (`agy`) CLI.

## Agents Included

- **`git_operator`**: Executes Git repository operations using `gemini-3.7-flash-low` for token efficiency.
- **`coder`**: Authors scripts, complex logic, and produces Change Impact Matrices in DRY-RUN mode using `gemini-3.7-flash-medium`.

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
- For all Git tasks, repository operations, and commands such as "commit and push", delegate execution to a subagent using invoke_subagent with Model set to "flash_lite" (Gemini 3.7 Flash Low). Define the subagent with tools to run commands if it is not already defined.
- For complex coding and infrastructure scripting tasks, invoke the "coder" subagent with Model set to "flash" (Gemini 3.7 Flash Medium) in DRY-RUN mode. When the coder subagent returns the script and Change Impact Matrix, present them to the user for confirmation. Execute the script directly in the Main Agent only after the user approves.
- Maintain persistent subagent instances: When a subagent (such as "coder" or "git_operator") has already been invoked in the session, reuse its active conversationID via send_message for all follow-up tasks and script iterations instead of spawning a new instance.
```
