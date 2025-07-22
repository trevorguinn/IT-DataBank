# rotate-backup-logs.ps1
# Archives old backup logs and deletes logs older than retention threshold

$logPath = "C:\BackupLogs"
$archivePath = "C:\BackupLogs\Archive"
$retentionDays = 30
$today = Get-Date -Format yyyy-MM-dd

# Create archive folder if it doesn't exist
If (!(Test-Path $archivePath)) {
    New-Item -Path $archivePath -ItemType Directory
}

# Move logs older than 7 days to archive
Get-ChildItem $logPath -File -Filter "*.log" | Where-Object {
    $_.LastWriteTime -lt (Get-Date).AddDays(-7)
} | ForEach-Object {
    Move-Item $_.FullName -Destination $archivePath
    Write-Host "Archived $_"
}

# Delete logs older than retention threshold
Get-ChildItem $archivePath -File -Filter "*.log" | Where-Object {
    $_.LastWriteTime -lt (Get-Date).AddDays(-$retentionDays)
} | Remove-Item -Force
