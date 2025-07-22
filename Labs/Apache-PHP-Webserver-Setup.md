# Web Server Setup with Apache and PHP

## Objective:

Deploy a basic web server on Linux Mint using Apache2 with PHP support. Test dynamic content rendering using a sample PHP page.

## Steps Taken:

1. Installed Apache2 and PHP:

```bash
sudo apt update
sudo apt install apache2 php libapache2-mod-php -y
```

2. Verified Apache service was running:

```bash
sudo systemctl status apache2
```

3. Created a PHP info test page:

```bash
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/index.php
sudo rm /var/www/html/index.html
```

4. Enabled HTTPS and site security modules:

```bash
sudo a2enmod ssl
sudo systemctl restart apache2
```

5. Accessed the site using the internal IP:

```bash
curl http://192.168.56.20
```

## Troubleshooting:

* Encountered "500 Internal Server Error" due to misconfigured PHP syntax.
* Ensured index.php was created correctly and Apache had permissions.
* Verified server’s IP with `ip a` and used `curl` to confirm page load.

## Result:

Apache2 with PHP successfully deployed on Linux Mint. Verified functionality with a PHP info page accessed from another VM on the LabNet network.

---

#  DNS Forwarding Configuration

## Objective:

Configure DNS forwarding on the Linux Mint BIND9 server to allow external domain resolution alongside internal DNS service.

## Steps Taken:

1. Edited `/etc/bind/named.conf.options`:

```conf
options {
    directory "/var/cache/bind";
    forwarders {
        8.8.8.8;
        8.8.4.4;
    };
    dnssec-validation auto;
    listen-on { any; };
    allow-query { any; };
};
```

2. Restarted the BIND service:

```bash
sudo systemctl restart bind9
```

3. Tested DNS resolution of external domains:

```bash
dig google.com @192.168.56.20
```

## Troubleshooting:

* Verified outgoing internet access from Mint and Kali.
* Ensured firewall allowed port 53.
* Confirmed `resolv.conf` pointed to Mint DNS server.

## Result:

DNS server on Mint now handles both internal and external domain resolution, forwarding non-local queries to public DNS resolvers.

---

