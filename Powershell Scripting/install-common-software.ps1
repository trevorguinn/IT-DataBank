# Silent install of Chrome and 7-Zip (example software)
Start-Process -FilePath "chrome_installer.exe" -ArgumentList "/silent" -Wait
Start-Process -FilePath "7zip_installer.msi" -ArgumentList "/quiet" -Wait
Write-Host "Chrome and 7-Zip installed."
