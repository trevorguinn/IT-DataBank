# 3-2-1 Backup Strategy: Comprehensive Backup Plan

## 🎯 Purpose

To ensure business continuity and data recovery by maintaining a resilient, secure, and redundant backup infrastructure using the 3-2-1 principle:
- **3 copies of data**
- **2 different storage types**
- **1 copy offsite or offline**

---

## 🧱 Strategy Summary

| Rule | Description |
|------|-------------|
| 3 Copies | 1 primary + 2 backups |
| 2 Storage Types | Example: local disk + NAS, or SSD + cloud |
| 1 Offsite | Physically separated or cloud-based |

---

## 🗂️ Data Categories & Backup Frequency

| Category             | Backup Type      | Frequency | Retention |
|----------------------|------------------|-----------|-----------|
| End-User Documents   | Incremental      | Daily     | 30 days   |
| Shared Drives        | Full + Diff      | Weekly    | 90 days   |
| System Images        | Full             | Monthly   | 6 months  |
| Config Files / Logs  | Versioned Archive| Daily     | 60 days   |
| Database Backups     | Snapshot         | Hourly    | 7 days    |

---

## 🛠️ Tools & Storage Setup

### 🔹 Local Backups
- **Tool**: Windows File History / rsync / PowerShell
- **Storage**: External HDD, secondary in


| Protection Area    | Practice                                      |
| ------------------ | --------------------------------------------- |
| Backup Encryption  | AES-256 for all cloud backups                 |
| Access Control     | Least privilege on backup storage             |
| Physical Security  | Locked server/NAS room, offsite encrypted HDD |
| Ransomware Defense | Immutable snapshots (where supported)         |



## Retention & Rotation Policy

Use GFS (Grandfather-Father-Son) rotation:

Daily (Son) backups: Keep 7 days

Weekly (Father) backups: Keep 4 weeks

Monthly (Grandfather): Keep 6 months

Archive critical systems to cold storage annually (external drive stored offsite)


## Recovery Testing Schedule

| Test Type             | Frequency  | Responsible |
| --------------------- | ---------- | ----------- |
| File-level Restore    | Monthly    | Help Desk   |
| Full VM Recovery      | Quarterly  | SysAdmin    |
| Offsite Restore Drill | Biannually | IT Manager  |


## Documentation & Logs

All backup jobs log to: \\server01\Logs\Backups\YYYY-MM-DD.txt

Failed job alerts are emailed automatically to: itadmin@company.local