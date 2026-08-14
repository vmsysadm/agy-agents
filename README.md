# AGY Custom Agents

Custom agent definitions and global rules for Google Antigravity (`agy`) CLI.

## Agents Included

- **`git_operator`**: Runs Git operations with `gemini-3.7-flash-low` for token efficiency.

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

## Manual Installation

1. Copy the `agents/` folder contents into `~/.gemini/config/agents/`.
2. Add the delegation rule to `~/.gemini/GEMINI.md`:

```markdown
- For all Git tasks, repository operations, and commands such as "commit and push", delegate execution to a subagent using invoke_subagent with Model set to "flash_lite" (Gemini 3.7 Flash Low). Define the subagent with tools to run commands if it is not already defined.
```
