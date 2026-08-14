$ErrorActionPreference = 'Stop'

$configDir = Join-Path $HOME '.gemini' 'config' 'agents'
if (-not (Test-Path $configDir)) {
    New-Item -ItemType Directory -Path $configDir -Force | Out-Null
}

$sourceAgents = Join-Path $PSScriptRoot 'agents'
Copy-Item -Path "$sourceAgents\*" -Destination $configDir -Recurse -Force

$geminiMd = Join-Path $HOME '.gemini' 'GEMINI.md'
$rule = '- For all Git tasks, repository operations, and commands such as "commit and push", delegate execution to a subagent using invoke_subagent with Model set to "flash_lite" (Gemini 3.7 Flash Low). Define the subagent with tools to run commands if it is not already defined.'

if (Test-Path $geminiMd) {
    $content = Get-Content -Path $geminiMd -Raw
    if ($content -notmatch [regex]::Escape($rule)) {
        Add-Content -Path $geminiMd -Value "`n$rule"
    }
} else {
    Set-Content -Path $geminiMd -Value $rule -Encoding utf8
}

Write-Host "Agents and rules installed successfully." -ForegroundColor Green
