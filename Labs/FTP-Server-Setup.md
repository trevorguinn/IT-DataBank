# FTP Server Setup

## Objective:

Install and configure an FTP server on Linux Mint using `vsftpd` to enable file transfers between hosts on the LabNet network.

## Steps Taken:

1. Installed the FTP server:

```bash
sudo apt install vsftpd -y
```

2. Configured `/etc/vsftpd.conf`:

* Enabled local user login:

```conf
local_enable=YES
```

* Enabled write permissions:

```conf
write_enable=YES
```

* Allowed FTP to run in a chroot environment:

```conf
chroot_local_user=YES
allow_writeable_chroot=YES
```

3. Created a test FTP user:

```bash
sudo adduser ftpuser
```

4. Set directory permissions:

```bash
sudo mkdir -p /home/ftpuser/ftp/files
sudo chown -R ftpuser:ftpuser /home/ftpuser/ftp
```

5. Restarted the FTP service:

```bash
sudo systemctl restart vsftpd
```

6. Connected from another VM using FTP:

```bash
ftp 192.168.56.20
```

## Troubleshooting:

* Initial login failures resolved by resetting the FTP user password.
* Resolved "allow\_writeable\_chroot" config error by explicitly enabling it in vsftpd.conf.
* Used `sudo tail -f /var/log/vsftpd.log` to monitor and debug login attempts.

## Result:

Established functional FTP service on Linux Mint VM. Verified successful login, upload, and download of files from Kali and Windows VMs.

---

*Lab documentation for professional portfolio and skill development.*
