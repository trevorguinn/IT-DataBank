# Centralized Logging with Rsyslog

## Objective:

Set up Linux Mint as a centralized syslog server and configure Kali Linux to forward logs to it over the LabNet internal network.

## Steps Taken:

### On Linux Mint (Syslog Server):

1. Verified rsyslog is installed and running:

```bash
sudo systemctl status rsyslog
```

2. Configured rsyslog to receive logs:

* Edited `/etc/rsyslog.conf` to uncomment and enable UDP/TCP reception:

```conf
module(load="imudp")
input(type="imudp" port="514")
module(load="imtcp")
input(type="imtcp" port="514")
```

3. Created directory for remote logs:

```bash
sudo mkdir -p /var/log/remote
```

4. Created a new config file `/etc/rsyslog.d/remote.conf`:

```conf
$template RemoteLogs,"/var/log/remote/%HOSTNAME%/%PROGRAMNAME%.log"
*.* ?RemoteLogs
```

5. Restarted rsyslog:

```bash
sudo systemctl restart rsyslog
```

### On Kali Linux (Syslog Client):

1. Ensured rsyslog was installed:

```bash
sudo apt install rsyslog -y
```

2. Edited `/etc/rsyslog.conf` to add log forwarding:

```conf
*.* @192.168.56.20:514
```

> (Replaced IP with Mint’s actual LabNet address.)

3. Restarted rsyslog on Kali:

```bash
sudo systemctl restart rsyslog
```

4. Sent test log message:

```bash
logger "Test message from Kali"
```

## Troubleshooting:

* Resolved connection issues caused by incorrect default route (NAT was taking priority over internal).
* Added static routes:

```bash
sudo ip route add 192.168.56.0/24 dev eth1  # On Kali
sudo ip route add 192.168.56.0/24 dev enp0s3  # On Mint
```

* Confirmed traffic was received using:

```bash
sudo tail -f /var/log/remote/*/*.log
```

## Result:

Successfully set up centralized log collection on Linux Mint with active forwarding from Kali. Verified incoming log messages and confirmed correct routing and syslog configuration.

---

*Lab documentation for professional portfolio and skill development.*
