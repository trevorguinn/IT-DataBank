# user-onboarding.ps1
# Automates AD user creation and home folder setup

param (
    [string]$username,
    [string]$firstname,
    [string]$lastname,
    [string]$department = "General"
)

$fullname = "$firstname $lastname"
$password = ConvertTo-SecureString "TempPass123!" -AsPlainText -Force
$ou = "OU=$department,DC=labnet,DC=local"

New-ADUser `
    -Name $fullname `
    -GivenName $firstname `
    -Surname $lastname `
    -SamAccountName $username `
    -UserPrincipalName "$username@labnet.local" `
    -AccountPassword $password `
    -Enabled $true `
    -Path $ou

Write-Host "User $fullname created in Active Directory."
