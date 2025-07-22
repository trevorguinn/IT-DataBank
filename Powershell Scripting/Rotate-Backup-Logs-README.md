## Purpose: Archives and cleans up old backup logs to prevent disk bloat. Moves backup .log files older than 7 days into an archive folder

Deletes archived logs older than 30 days

## How to Use:

Open PowerShell as Administrator

## Run the script manually:


.\rotate-backup-logs.ps1
Ensure the following folders exist:

C:\BackupLogs

C:\BackupLogs\Archive

## Schedule Weekly via Task Scheduler:

Create Basic Task → Name: “Rotate Backup Logs”

Trigger: Weekly, every Sunday at 11:59 PM

Action: Start a program → powershell.exe

## Add arguments:

-ExecutionPolicy Bypass -File "C:\Scripts\rotate-backup-logs.ps1"

Finish Setup