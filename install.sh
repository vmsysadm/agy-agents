#!/usr/bin/env bash
set -e

CONFIG_DIR="$HOME/.gemini/config/agents"
mkdir -p "$CONFIG_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp -R "$SCRIPT_DIR/agents/"* "$CONFIG_DIR/"

GEMINI_MD="$HOME/.gemini/GEMINI.md"
RULE='- For all Git tasks, repository operations, and commands such as "commit and push", delegate execution to a subagent using invoke_subagent with Model set to "flash_lite" (Gemini 3.7 Flash Low). Define the subagent with tools to run commands if it is not already defined.'

if [ -f "$GEMINI_MD" ]; then
    if ! grep -qF "$RULE" "$GEMINI_MD"; then
        printf "\n%s\n" "$RULE" >> "$GEMINI_MD"
    fi
else
    printf "%s\n" "$RULE" > "$GEMINI_MD"
fi

echo "Agents and rules installed successfully."
