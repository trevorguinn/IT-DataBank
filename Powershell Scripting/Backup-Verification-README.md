## Purpose: Checks if backup folders exist and are updated recently (within X days).
#  Script: `verify-backups.ps1`

**Purpose:**  
Checks a list of critical backup locations to confirm:
- The path exists
- Files were modified recently (e.g., within 2 days)

**How to Use:**
1. Open PowerShell as Administrator
2. Run the script manually:
   ```powershell
   .\verify-backups.ps1
Adjust $backupPaths and $cutoffDays inside the script as needed.

Schedule in Task Scheduler (Windows):

Create Basic Task → Name: “Backup Verifier”

Trigger: Daily at 9:00 AM

Action: Start a program → Program: powershell.exe

Add arguments:

-ExecutionPolicy Bypass -File "C:\Scripts\verify-backups.ps1"


Finish setup