<#
.SYNOPSIS
Installs software and configures settings based on department.

.DESCRIPTION
This script is run post-image during workstation deployment. It installs specific software, maps drives, and configures printers based on the department selected.

.PARAMETER dept
The department to configure (e.g. "Outreach", "Finance", "IT").

.EXAMPLE
.\install-dept-software.ps1 -dept "Finance"
#>

param (
    [Parameter(Mandatory=$true)]
    [ValidateSet("Outreach", "Finance", "IT", "HR")]
    [string]$dept
)

Write-Host "🔧 Configuring system for $dept department..." -ForegroundColor Cyan

# Example software paths (replace with actual .exe/.msi if available)
$software = @{
    "Outreach" = @("C:\Installers\ZoomInstaller.exe", "C:\Installers\SlackSetup.exe")
    "Finance"  = @("C:\Installers\QuickBooks.msi", "C:\Installers\VPNClient.exe")
    "IT"       = @("C:\Installers\RemoteTools.msi", "C:\Installers\SysInternals.msi")
    "HR"       = @("C:\Installers\DocuSignInstaller.exe")
}

# Install Department Software
foreach ($app in $software[$dept]) {
    if (Test-Path $app) {
        Write-Host "Installing $app..."
        Start-Process -FilePath $app -ArgumentList "/quiet" -Wait
    } else {
        Write-Warning "Could not find installer: $app"
    }
}

# Example Drive Mapping
switch ($dept) {
    "Finance" {
        New-PSDrive -Name "F" -PSProvider FileSystem -Root "\\fileserver01\Finance" -Persist
    }
    "Outreach" {
        New-PSDrive -Name "O" -PSProvider FileSystem -Root "\\fileserver01\Outreach" -Persist
    }
}

# Printer Setup (example)
$printerPath = "\\printserver01\$dept-Printer"
if (Get-Printer -Name "$dept-Printer" -ErrorAction SilentlyContinue) {
    Write-Host "Printer already installed."
} else {
    Add-Printer -ConnectionName $printerPath
    Write-Host "Added printer: $printerPath"
}

Write-Host "✅ $dept setup complete." -ForegroundColor Green
