# User Audit Script for Windows
# Collects info on local users and their last logon times

Write-Output "Gathering local user account details..."

$users = Get-LocalUser | Where-Object { $_.Name -ne "Administrator" -and $_.Name -ne "Guest" }

foreach ($user in $users) {
    $lastLogon = $user.LastLogon
    $enabled = if ($user.Enabled) { "Enabled" } else { "Disabled" }
    Write-Output "Username: $($user.Name)"
    Write-Output "  Full Name: $($user.FullName)"
    Write-Output "  Enabled: $enabled"
    Write-Output "  Last Logon: $lastLogon"
    Write-Output "-----------------------------------------"
}

Write-Output "User audit complete."
