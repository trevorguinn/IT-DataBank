# LabNet VirtualBox Network Setup

## Overview
Simulates a segmented network with firewall and DHCP server.

## Topology
- DC01: Windows Server 2019 (Active Directory, DNS)
- FW01: pfSense firewall (NAT + LAN)
- CLIENT01: Windows 10 workstation

## VirtualBox Configuration
- NAT Network: LabNet
- Internal Adapter: LAN segment
- Static IPs assigned to each VM