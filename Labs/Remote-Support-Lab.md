# Remote Support Lab (SSH & RDP)

## Purpose
Simulate secure remote access using SSH and RDP in a virtual lab.

## Setup
- Host: Windows Server 2019 (RDP enabled)
- Client: Windows 10 (RDP client)
- Linux Jump Box: Ubuntu VM with SSH

## Lab Steps
1. Configure RDP and test from internal IP
2. On Linux, install and configure `openssh-server`
3. SSH from Windows using `PuTTY` or PowerShell
4. Create local user, enable UFW firewall, and test SSH access control
