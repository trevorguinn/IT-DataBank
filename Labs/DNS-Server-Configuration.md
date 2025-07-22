# Lab 2: DNS Server Configuration

## Objective:

Deploy a functioning DNS server using BIND9 on Linux Mint to handle name resolution within the internal LabNet network.

## Steps Taken:

1. Installed BIND9 on Linux Mint:

```bash
sudo apt install bind9 bind9utils bind9-doc -y
```

2. Created a forward lookup zone for the domain `labnet.local`:

   * Configured `/etc/bind/named.conf.local` to include the new zone.
   * Created zone file `/etc/bind/db.labnet.local` with A and NS records.
3. Updated `/etc/bind/named.conf.options` to set DNS forwarding and allow queries from internal subnet.
4. Restarted BIND9 service to apply changes:

```bash
sudo systemctl restart bind9
```

5. Tested DNS resolution locally using:

```bash
dig server1.labnet.local @127.0.0.1
```

## Troubleshooting:

* Encountered syntax errors in the zone file that prevented BIND from loading the configuration.
* Errors included:

  * Unexpected end of input
  * Missing SOA and NS records
* Resolved by correcting formatting and ensuring proper entries:

```dns
@   IN  SOA server1.labnet.local. admin.labnet.local. (
        2025070601 ; Serial
        3600       ; Refresh
        1800       ; Retry
        1209600    ; Expire
        86400 )    ; Minimum TTL

    IN  NS  server1.labnet.local.
server1 IN  A   192.168.56.20
```

## Result:

Successful DNS resolution of local domain names within the LabNet network. Validated responses using `dig` and DNS queries from both Mint and Kali.


