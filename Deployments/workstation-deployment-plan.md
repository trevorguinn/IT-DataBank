# Workstation Deployment Plan – Remote Field Office

## Overview

This plan outlines the steps to image, configure, and deliver 25 standardized Windows 10 laptops for a new remote field office. Deployment is performed by IT support staff using the Microsoft Deployment Toolkit (MDT) with PowerShell automation.

---

## Device & Image Details

| Spec               | Value                     |
|--------------------|---------------------------|
| Model              | Dell Latitude 5520        |
| OS                 | Windows 10 Pro (22H2)     |
| Image Type         | MDT Task Sequence         |
| Applications       | Chrome, M365, Zoom, AV    |
| Domain             | `corp.local`              |
| Licensing          | Volume license / Azure AD |

---

## Pre-Deployment Tasks

- [ ] Validate MDT share with latest image
- [ ] Update Windows 10 base WIM with cumulative patch
- [ ] Print asset tags and workstation labels
- [ ] Verify network switch ports and DHCP availability

---

## Imaging Process (Using MDT)

1. Boot laptop to PXE or USB MDT media
2. Select task sequence: `Office-Standard`
3. Automatically installs:
   - Windows 10 Pro (patched)
   - Chrome, M365, antivirus, remote support agent
   - Local admin account (`techadmin`)
4. Logs output to `\\MDT01\DeploymentLogs\HOSTNAME.txt`

---

## Post-Deployment Configuration

- [ ] Rename machine to `FIELD-PC###`
- [ ] Join to domain `corp.local`
- [ ] Run PowerShell script:

   ```powershell
   .\install-dept-software.ps1 -dept "Outreach"
 Add to SCCM or Intune collection

 Test VPN and RDP connectivity

 Assign user and complete profile setup

## Validation Checklist
Check	Status          [ ]
User can log in with AD	[ ]
Network drive mapped	[ ]
Printer test page works	[ ]
Remote support agent online	[ ]
All apps launch properly	[ ]
Windows activated	[ ]

## Documentation & Tracking
Asset Tag	Hostname	User	Deploy Date	Status
CRW-101	FIELD-PC01	k.ramirez	2025-07-08	Completed
...	...	...	...	...

All deployment logs saved to: \\mdt01\DeploymentLogs\

## Reimaging or Break-Fix

If rebuild needed, repeat PXE boot → select Reimage-TaskSeq

Logs to same directory

All reimages recorded in deployment tracker

## Security Notes

BIOS locked with password

BitLocker enabled via GPO

Default password policy enforced

Workstations are compliant with GPO baseline