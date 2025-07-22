<#
.SYNOPSIS
Backs up LabNet documentation, logs, and lab files into a timestamped ZIP archive.

.DESCRIPTION
This script collects specified folders from your LabNet home lab and archives them to a compressed ZIP file.
It ensures all paths exist, creates necessary folders, and logs the outcome for traceability.

.EXAMPLE
.\labnet-backup.ps1
#>

# Parameters (customize if needed)
$LabNetRoot      = "$env:USERPROFILE\Documents\LabNet"
$FoldersToBackup = @("docs", "logs", "labs")
$BackupFolder    = "$LabNetRoot\archives"
$LogFile         = "$LabNetRoot\backup-log.txt"

# Generate timestamp
$timestamp = Get-Date -Format "yyyyMMdd-HHmm"
$zipFileName = "LabNetBackup_$timestamp.zip"
$destinationZip = Join-Path -Path $BackupFolder -ChildPath $zipFileName

# Create backup folder if missing
if (!(Test-Path $BackupFolder)) {
    New-Item -Path $BackupFolder -ItemType Directory -Force | Out-Null
}

# Build valid source paths
$validPaths = @()
foreach ($folder in $FoldersToBackup) {
    $fullPath = Join-Path -Path $LabNetRoot -ChildPath $folder
    if (Test-Path $fullPath) {
        $validPaths += $fullPath
    } else {
        Write-Warning "Missing folder: $fullPath — skipping."
    }
}

# Perform backup
try {
    if ($validPaths.Count -eq 0) {
        throw "No valid folders found for backup."
    }

    Compress-Archive -Path $validPaths -DestinationPath $destinationZip -Force
    Write-Host " Backup created: $destinationZip"

    Add-Content -Path $LogFile -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Backup successful: $destinationZip"

} catch {
    Write-Error " Backup failed: $_"
    Add-Content -Path $LogFile -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Backup failed: $_"
}



## Schedule It to Run Weekly:
Open Task Scheduler → Create Basic Task

Name: Weekly LabNet Backup

Trigger: Weekly (e.g., Sunday @ 10PM)

Action: Start a program
Program/script: powershell.exe
Add arguments:

-ExecutionPolicy Bypass -File "C:\Users\YourName\Documents\LabNet\scripts\labnet-backup.ps1"
