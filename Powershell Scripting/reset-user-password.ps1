# Reset a domain user's password
param (
    [string]$username,
    [string]$newpassword = "TempPass123!"
)

$password = ConvertTo-SecureString $newpassword -AsPlainText -Force
Set-ADAccountPassword -Identity $username -NewPassword $password -Reset
Unlock-ADAccount -Identity $username
Write-Host "Password reset and account unlocked for $username."
