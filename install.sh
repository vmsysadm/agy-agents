#!/usr/bin/env bash
set -e

CONFIG_DIR="$HOME/.gemini/config/agents"
mkdir -p "$CONFIG_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp -R "$SCRIPT_DIR/agents/"* "$CONFIG_DIR/"

GEMINI_MD="$HOME/.gemini/GEMINI.md"
RULES=(
"- Use ASD-STE100 Simplified Technical English."
"- For all Git tasks, repository operations, and commands such as \"commit and push\", delegate execution to a subagent using invoke_subagent with Model set to \"flash_lite\" (Gemini 3.7 Flash Low). Git subagents are ephemeral and do not need to be persistent. Define the subagent with tools to run commands if it is not already defined."
"- For complex coding and infrastructure scripting tasks, invoke the \"coder\" subagent with Model set to \"flash\" (Gemini 3.7 Flash Medium) in DRY-RUN mode. The coder writes the script and log configuration directly to disk, returning only the script path, log path, and Change Impact Matrix. Present the impact matrix to the user for confirmation. Execute the script directly in the Main Agent only after user approval. If execution fails, send the error trace back to the coder via send_message so it can inspect the logs, diagnose, and remediate."
"- Maintain a persistent \"coder\" subagent instance: When the \"coder\" subagent has already been invoked in the session, reuse its active conversationID via send_message for all follow-up tasks and script iterations instead of spawning a new instance."
"- Whenever you invoke a subagent, immediately output the full path to its transcript log file (~/.gemini/antigravity-cli/brain/<conversation-id>/.system_generated/logs/transcript_full.jsonl) so the user can inspect or tail it."
)

for rule in "${RULES[@]}"; do
    if [ -f "$GEMINI_MD" ]; then
        if ! grep -qF "$rule" "$GEMINI_MD"; then
            printf "\n%s\n" "$rule" >> "$GEMINI_MD"
        fi
    else
        printf "%s\n" "$rule" > "$GEMINI_MD"
    fi
done

echo "Agents and rules installed successfully."
