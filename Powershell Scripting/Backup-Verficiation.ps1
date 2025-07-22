# verify-backups.ps1
# Verifies that critical backup paths exist and have recent files

$backupPaths = @(
    "E:\Backups\UserData",
    "\\NAS01\DailyBackups",
    "D:\SystemImages"
)

$cutoffDays = 2
$cutoffDate = (Get-Date).AddDays(-$cutoffDays)

foreach ($path in $backupPaths) {
    if (Test-Path $path) {
        $latest = Get-ChildItem -Path $path -Recurse | Sort-Object LastWriteTime -Descending | Select-Object -First 1
        if ($latest -and $latest.LastWriteTime -ge $cutoffDate) {
            Write-Host "✅ $path is up-to-date (Last modified: $($latest.LastWriteTime))"
        } else {
            Write-Warning "⚠️ $path exists but may be outdated (Last modified: $($latest.LastWriteTime))"
        }
    } else {
        Write-Error "❌ Path $path does not exist!"
    }
}
