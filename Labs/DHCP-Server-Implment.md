# DHCP Server Implementation

## Objective:

Set up a DHCP server on Linux Mint to dynamically assign IP addresses to clients on the LabNet internal network.

## Steps Taken:

1. Installed the DHCP server package:

```bash
sudo apt install isc-dhcp-server -y
```

2. Edited DHCP configuration file `/etc/dhcp/dhcpd.conf` to define subnet and IP range:

```conf
subnet 192.168.56.0 netmask 255.255.255.0 {
  range 192.168.56.100 192.168.56.200;
  option routers 192.168.56.1;
  option domain-name-servers 192.168.56.20;
  option domain-name "labnet.local";
}
```

3. Set the interface to listen on by editing `/etc/default/isc-dhcp-server`:

```conf
INTERFACESv4="enp0s3"
```

4. Restarted the DHCP server:

```bash
sudo systemctl restart isc-dhcp-server
```

5. Verified the DHCP lease issuance by booting another VM (e.g., Kali or Windows) with automatic IP assignment.

## Troubleshooting:

* Encountered startup failure due to missing or misconfigured subnet declaration.
* Used `journalctl -xe` and `systemctl status isc-dhcp-server` to diagnose issues.
* Fixed by ensuring all required fields were present and correctly formatted in `dhcpd.conf`.

## Result:

DHCP server successfully assigned dynamic IP addresses to clients on the internal LabNet network, confirming functionality with auto-configured Kali and Windows VMs.

---