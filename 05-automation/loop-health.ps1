# loop-health.ps1  -  the job that watches the jobs. Uses no AI at all.
# Chapter 13, "Running Without You: Headless and Scheduled Work"
#
# For each scheduled job it checks three things:
#   1. Does the task exist, and is it switched on?
#   2. What was its last result code? (0 means OK)
#   3. How old is the newest report file?
# Any problem becomes an alarm note in your inbox folder, so you
# (or your morning briefing) will see it.
#
# Schedule it like any other job, for example every Monday morning:
#   -NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File C:\ai-jobs\loop-health.ps1

# ---- SETTINGS (change these) ---------------------------------
$Base  = "C:\ai-jobs"
$Inbox = "C:\path\to\your\work-folder\inbox"

# Task = name in Task Scheduler. Report = folder under reports\.
# MaxHours = how old the newest report may be before it counts as late.
$Jobs = @(
    @{ Task = "AI-Morning-Briefing"; Report = "morning-briefing"
       MaxHours = 30 },
    @{ Task = "AI-Weekly-Review";    Report = "weekly-review"
       MaxHours = 192 }
)
# ---------------------------------------------------------------

# Result codes that are not errors.
$NotErrors = @(0, 267009)   # 267009 = the task is running right now

$problems = @()

foreach ($job in $Jobs) {
    $name = $job.Task
    $task = Get-ScheduledTask -TaskName $name -ErrorAction SilentlyContinue
    if (-not $task) {
        $problems += "${name}: task not found in Task Scheduler"
        continue
    }
    if ($task.State -eq "Disabled") {
        $problems += "${name}: task is disabled"
    }

    $info = Get-ScheduledTaskInfo -TaskName $name
    if ($NotErrors -notcontains $info.LastTaskResult) {
        $problems += "${name}: last result code $($info.LastTaskResult) (last run $($info.LastRunTime))"
    }

    $dir = Join-Path $Base "reports\$($job.Report)"
    $newest = Get-ChildItem -Path $dir -File -ErrorAction SilentlyContinue |
              Sort-Object LastWriteTime -Descending |
              Select-Object -First 1
    if (-not $newest) {
        $problems += "${name}: no report file found in $dir"
    }
    else {
        $age = [math]::Round(((Get-Date) - $newest.LastWriteTime).TotalHours, 1)
        if ($age -gt $job.MaxHours) {
            $problems += "${name}: newest report is $age hours old (limit $($job.MaxHours))"
        }
    }
}

if ($problems.Count -eq 0) {
    exit 0
}

# Create the inbox if it is missing, then drop the alarm there.
if (-not (Test-Path $Inbox)) {
    New-Item -ItemType Directory -Path $Inbox -Force | Out-Null
}
$stamp = Get-Date -Format "yyyy-MM-dd_HHmm"
$alarm = Join-Path $Inbox "ALARM-scheduled-jobs-$stamp.md"
$lines = @("# Scheduled jobs need attention ($stamp)", "") + ($problems | ForEach-Object { "- $_" })
$lines | Out-File -FilePath $alarm -Encoding utf8

exit 1
