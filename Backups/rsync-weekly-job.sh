#!/bin/bash
# Weekly rsync backup script 

SRC="/home"
DEST="/mnt/backup/home-$(date +%F)"
LOG="/var/log/rsync-backup.log"

# Ensure destination exists
mkdir -p "$DEST"

# Ensure log file is writable
touch "$LOG" || { echo "Cannot write to log file $LOG"; exit 1; }

echo "===== Backup started at $(date) =====" >> "$LOG"
rsync -avh --delete "$SRC" "$DEST" >> "$LOG" 2>&1

if [ $? -eq 0 ]; then
  echo "Backup completed successfully at $(date)" >> "$LOG"
else
  echo "Backup FAILED at $(date)" >> "$LOG"
fi

echo "======================================" >> "$LOG"
