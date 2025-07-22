# LabNet Overview – Virtual IT Environment

This document summarizes the internal lab network I built using VirtualBox, simulating a real-world IT support and systems environment. It includes Active Directory, Linux services, firewall configuration, user simulation, and troubleshooting practice.

---

## Network Topology

![Lab Network Diagram](../assets/labnet-diagram.png)  
*Located in: `assets/labnet-diagram.png` (or your GitHub image folder)*

---

## LabNet Environment Summary

| Component         | Description |
|------------------|-------------|
| **Network Name** | LabNet (Internal VirtualBox Network) |
| **Subnet**       | `192.168.56.0/24` |
| **Gateway**      | None (isolated network) |
| **Internet**     | Disabled (fully internal testing environment) |
| **Host-only NAT**| Used for updates and package downloads if needed (temporarily toggled on) |

---

## Virtual Machines

| VM Name        | OS           | Role                      | IP Address         |
|----------------|--------------|---------------------------|--------------------|
| `lab-dc01`     | Windows Server 2019 | Domain Controller, DNS, DHCP, GPO | `192.168.56.10` |
| `lab-win10`    | Windows 10 Pro      | Domain-joined workstation          | `192.168.56.20` |
| `lab-linux01`  | Ubuntu Server 22.04 | Syslog server, SSH, IDS testing    | `192.168.56.30` |
| `lab-fw01`     | pfSense             | Future: Simulated firewall/router | `192.168.56.1` (planned) |

---

## Domain Information

- **Domain**: `lab.local`
- **Administrator**: `labadmin`
- **Organizational Units (OUs)**:
  - `Users`
  - `Workstations`
  - `Service Accounts`
- **GPOs Configured**:
  - Password policy
  - RDP enabled
  - Windows Update set to WSUS (simulated)

---

## Lab Capabilities & Scenarios

This lab is designed to practice:

- Domain join and group policy deployment
- PowerShell remote admin
- AD user management & group permissions
- Syslog forwarding and parsing (`/var/log/syslog`)
- Basic DNS and DHCP setup
- Troubleshooting broken adapters, NAT errors, and failed pings
- Testing login failures and permission issues

---

## Tools Used

- VirtualBox (hosted on Lenovo ThinkBook)
- Windows Server Evaluation ISO
- Ubuntu Server ISO
- PowerShell 7
- SSH, rsyslog, fail2ban (Linux tools)
- GitHub Codespaces (for documentation and version control)

---

## Future Additions

- Install and configure pfSense (`lab-fw01`)
- Implement VLAN simulation using pfSense or managed switch emulator
- Add second domain (test.local) for trust testing
- Simulate backups between VMs
- Add monitoring tools (Zabbix, Nagios)

---

## Related Files

- Troubleshooting Log: [`labnet-issues-log.md`](labnet-issues-log.md)
- Deployment Scripts: [`scripts/` folder](../scripts/)
- Home Lab Setup Guide: [`home-lab-setup-guide.md`](../docs/home-lab-setup-guide.md)

---

## Lessons Learned

- Static IP addressing is critical when DHCP is not yet available
- DNS misconfigurations are common in isolated labs — `/etc/hosts` and AD DNS roles help
- Group Policy changes require patience and multiple reboots (`gpupdate /force`)
- Isolated labs are perfect for safe failure and learning recovery

---

## Status

This lab is **active and expanding**. It supports hands-on skill development across:
- Desktop support
- Windows administration
- Linux services
- Network planning
