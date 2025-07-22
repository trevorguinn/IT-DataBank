# Virtual Machine and Networking Setup

## Objective:

Set up virtual machines with Oracle VirtualBox and configure an internal network (`LabNet`) along with NAT adapters to provide internet connectivity.

## Steps Taken:

1. Installed Oracle VirtualBox.
2. Created three virtual machines: Kali Linux, Linux Mint, and Windows 10.
3. Configured network adapters:

   * Adapter 1: Internal network named `LabNet`.
   * Adapter 2: NAT for internet access.
4. Assigned static IP addresses:

   * Kali Linux: `192.168.56.11`
   * Linux Mint: `192.168.56.20`
   * Windows 10: `192.168.56.10`
5. Verified network configuration and connectivity between VMs.

## Troubleshooting:

* Addressed connectivity issues by manually adding static routes to prioritize internal network traffic:

```bash
# Kali Linux
sudo ip route add 192.168.56.0/24 dev eth1

# Linux Mint
sudo ip route add 192.168.56.0/24 dev enp0s3
```

* Tested and confirmed successful ping responses between VMs.

## Result:

Successfully established a working internal virtual network environment, allowing further lab projects and troubleshooting exercises.

