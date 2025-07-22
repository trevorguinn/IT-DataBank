# FTP Authentication and User Permissions

## Objective:

Enhance the existing FTP server by configuring secure user authentication, validating login access, and managing file permissions.

## Steps Taken:

1. Verified `vsftpd` service was active:

```bash
sudo systemctl status vsftpd
```

2. Created a dedicated FTP user:

```bash
sudo adduser ftpuser
sudo passwd ftpuser
```

3. Set up FTP directory structure:

```bash
sudo mkdir -p /home/ftpuser/ftp/files
sudo chown -R ftpuser:ftpuser /home/ftpuser/ftp
sudo chmod 750 /home/ftpuser/ftp
```

4. Configured vsftpd to allow chroot access and uploads:
   Edited `/etc/vsftpd.conf`:

```conf
chroot_local_user=YES
allow_writeable_chroot=YES
local_enable=YES
write_enable=YES
```

5. Restarted vsftpd:

```bash
sudo systemctl restart vsftpd
```

6. Connected using FTP client:

```bash
ftp 192.168.56.20
```

* Logged in as `ftpuser`.
* Navigated, uploaded, and downloaded test files.

## Troubleshooting:

* Encountered login failures due to password typos.
* Resolved 421 Timeout issues by restarting the vsftpd service.
* Verified logins and activity using:

```bash
sudo tail -f /var/log/vsftpd.log
```

## Result:

FTP user login, file upload, and access permissions successfully validated on the Mint server. Secure and functional FTP environment established for local testing.

---
