# Lab 5: SQL Database Server Setup

## Objective:

Install and configure a MariaDB SQL database server on Linux Mint to support structured data storage and querying within the LabNet network.

## Steps Taken:

1. Installed the MariaDB server package:

```bash
sudo apt install mariadb-server -y
```

2. Secured the database installation:

```bash
sudo mysql_secure_installation
```

* Set root password
* Disabled remote root login
* Removed test database

3. Accessed the MariaDB shell:

```bash
sudo mysql -u root -p
```

4. Created a test database, user, and table:

```sql
CREATE DATABASE testlab;
CREATE USER 'labuser'@'%' IDENTIFIED BY 'LabPass123';
GRANT ALL PRIVILEGES ON testlab.* TO 'labuser'@'%';
FLUSH PRIVILEGES;
USE testlab;
CREATE TABLE inventory (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100), quantity INT);
```

5. Verified local and remote access (via tools like `mysql`, `HeidiSQL`, or `phpMyAdmin`).

## Troubleshooting:

* Addressed login issues due to missing user privileges.
* Enabled remote access by editing `/etc/mysql/mariadb.conf.d/50-server.cnf` to bind to `0.0.0.0`.
* Restarted the database service:

```bash
sudo systemctl restart mariadb
```

## Result:

Successfully configured MariaDB server on Linux Mint. Verified creation of databases and tables, and validated SQL queries from Kali VM using local and remote connections.

---
