# run-job.ps1  -  runs one Claude Code job without you, and keeps a log.
# Chapter 13, "Running Without You: Headless and Scheduled Work"
#
# How Task Scheduler calls it ("Add arguments" box):
#   -NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File C:\ai-jobs\run-job.ps1 -JobName morning-briefing
#
# Change the paths in the SETTINGS block. No passwords or keys go in this file.
# Claude only reads and answers. This script saves the answer as a report.

param(
    [Parameter(Mandatory = $true)]
    [string]$JobName
)

# ---- SETTINGS (change these) ---------------------------------
$Base      = "C:\ai-jobs"                      # where this kit lives
$WorkDir   = "C:\path\to\your\work-folder"    # folder Claude works in
# ---------------------------------------------------------------

$Prompt    = Join-Path $Base "prompts\$JobName.md"
$ReportDir = Join-Path $Base "reports\$JobName"
$LogDir    = Join-Path $Base "logs"
$stamp     = Get-Date -Format "yyyy-MM-dd_HHmm"
$report    = Join-Path $ReportDir "$stamp.md"
$log       = Join-Path $LogDir "$JobName.log"

# Create folders if they are missing. Never assume a folder exists.
foreach ($dir in @($ReportDir, $LogDir)) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

function Write-Log([string]$text) {
    $time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $log -Value "$time  $text"
}

Write-Log "START $JobName"

if (-not (Test-Path $Prompt)) {
    Write-Log "FAIL prompt file not found: $Prompt"
    exit 2
}
if (-not (Test-Path $WorkDir)) {
    Write-Log "FAIL work folder not found: $WorkDir"
    exit 3
}

# Keep double quotes out of your prompt file. Use single quotes instead.
$promptText = Get-Content -Path $Prompt -Raw
Set-Location $WorkDir

# If Windows says "claude is not recognized", replace claude below
# with the full path to claude.exe on your computer.
# --permission-mode dontAsk: reading is allowed, anything else that is
# not pre-approved is refused.
# --permission-prompts none: anything that would need your approval
# is refused instead of waiting all night for a click.
$output = & claude -p $promptText --output-format text --permission-mode dontAsk --permission-prompts none 2>&1
$code = $LASTEXITCODE

$output | Out-File -FilePath $report -Encoding utf8

if ($code -ne 0) {
    Write-Log "FAIL claude exit code $code (see $report)"
}
elseif ((Get-Item $report).Length -lt 50) {
    Write-Log "WARN report is almost empty: $report"
    $code = 4
}
else {
    Write-Log "OK report saved: $report"
}

# Pass the result on, so Task Scheduler's "Last Run Result" tells the truth.
exit $code
