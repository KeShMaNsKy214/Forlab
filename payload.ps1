$ErrorActionPreference = 'Stop'

$evidenceDirectory = 'C:\Lab'
$evidenceFile = Join-Path $evidenceDirectory 'executed.txt'

if (-not (Test-Path -LiteralPath $evidenceDirectory -PathType Container)) {
    New-Item -Path $evidenceDirectory -ItemType Directory -Force | Out-Null
}

$timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
$username = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$computer = $env:COMPUTERNAME

$evidence = @"
Execution time : $timestamp
User           : $username
Computer       : $computer
"@

Set-Content `
    -LiteralPath $evidenceFile `
    -Value $evidence `
    -Encoding UTF8

Write-Host "Payload успешно выполнен."
Write-Host "Evidence: $evidenceFile"
