# Standard Operating Procedure: Reimaging a Windows 10 Workstation

## Purpose
To restore a workstation to a clean state for reuse or repair.

## Tools Required
- USB drive with bootable image (MDT or Clonezilla)
- Asset tag number
- Admin credentials

## Steps
1. Boot from USB recovery media
2. Launch imaging tool and select appropriate task sequence
3. Apply image, drivers, and updates
4. Join domain or workgroup
5. Rename PC (Asset Tag = Hostname)
6. Install essential apps (Chrome, Office, M365)
7. Perform post-image checklist:
   - [ ] Device Manager = No errors
   - [ ] Windows Activated
   - [ ] User can log in

## Notes
Save logs to `\\fileserver01\ImagingLogs\YYYY-MM-DD`
