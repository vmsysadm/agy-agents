$ErrorActionPreference = 'Stop'

$configDir = Join-Path $HOME '.gemini' 'config' 'agents'
if (-not (Test-Path $configDir)) {
    New-Item -ItemType Directory -Path $configDir -Force | Out-Null
}

$sourceAgents = Join-Path $PSScriptRoot 'agents'
Copy-Item -Path "$sourceAgents\*" -Destination $configDir -Recurse -Force

$geminiMd = Join-Path $HOME '.gemini' 'GEMINI.md'
$rules = @(
    '- Use ASD-STE100 Simplified Technical English.',
    '- For all Git tasks, repository operations, and commands such as "commit and push", delegate execution to a subagent using invoke_subagent with Model set to "flash_lite" (Gemini 3.7 Flash Low). Git subagents are ephemeral and do not need to be persistent. Define the subagent with tools to run commands if it is not already defined.',
    '- For complex coding and infrastructure scripting tasks, invoke the "coder" subagent with Model set to "flash" (Gemini 3.7 Flash Medium) in DRY-RUN mode. The coder writes the script and log configuration directly to disk, returning only the script path, log path, and Change Impact Matrix. Present the impact matrix to the user for confirmation. Execute the script directly in the Main Agent only after user approval. If execution fails, send the error trace back to the coder via send_message so it can inspect the logs, diagnose, and remediate.',
    '- Maintain a persistent "coder" subagent instance: When the "coder" subagent has already been invoked in the session, reuse its active conversationID via send_message for all follow-up tasks and script iterations instead of spawning a new instance.',
    '- Whenever you invoke a subagent, immediately output the full path to its transcript log file (~/.gemini/antigravity-cli/brain/<conversation-id>/.system_generated/logs/transcript_full.jsonl) so the user can inspect or tail it.'
)

if (Test-Path $geminiMd) {
    $existing = Get-Content -Path $geminiMd -Raw
    foreach ($rule in $rules) {
        if ($existing -notmatch [regex]::Escape($rule)) {
            Add-Content -Path $geminiMd -Value "`n$rule"
        }
    }
} else {
    Set-Content -Path $geminiMd -Value ($rules -join "`n") -Encoding utf8
}

Write-Host "Agents and rules installed successfully." -ForegroundColor Green
