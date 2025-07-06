# windows-healthcheck.ps1
# A simple PowerShell script to check basic system health

Write-Host "=== System Health Check ==="
Write-Host "Computer Name: $env:COMPUTERNAME"
Write-Host "Uptime: $(Get-Uptime)"

# Disk usage
Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{Name="FreeSpace(GB)";Expression={"{0:N2}" -f ($_.Free/1GB)}}, @{Name="UsedSpace(GB)";Expression={"{0:N2}" -f (($_.Used)/1GB)}}

# Memory info
Get-CimInstance -ClassName Win32_OperatingSystem | 
Select-Object TotalVisibleMemorySize, FreePhysicalMemory, @{Name="UsedMemory";Expression={($_.TotalVisibleMemorySize - $_.FreePhysicalMemory)}}
