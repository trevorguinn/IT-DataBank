#!/bin/bash

# linux-backup.sh - Simple backup script
echo "Starting backup of home directory..."
DATE=$(date +%Y-%m-%d)
DEST="/mnt/backup/home-backup-$DATE.tar.gz"

tar -czvf "$DEST" /home/$USER
echo "Backup completed: $DEST"
