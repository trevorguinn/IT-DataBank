# Maps shared drive and default printer at logon

# Map Network Drive
New-PSDrive -Name "M" -PSProvider "FileSystem" -Root "\\fileserver01\Marketing" -Persist

# Set Default Printer
$printerPath = "\\printserver01\Marketing-Printer"
Add-Printer -ConnectionName $printerPath
Set-Printer -Name "Marketing-Printer" -IsDefault $true

Write-Host "Drives and printer configured successfully."
