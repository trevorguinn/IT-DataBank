# Windows Imaging Guide

## Tools Used
- Microsoft Deployment Toolkit (MDT)
- Sysprep
- DISM
- Rufus for bootable media

## Steps
1. Install a clean Windows OS on a reference machine
2. Customize and install required software
3. Run `sysprep /oobe /generalize /shutdown`
4. Capture image using DISM or Clonezilla
5. Deploy via bootable media or PXE
