#!/bin/bash

# -------------------------------
# LabNet Backup Script (Linux)
# -------------------------------
# Description: Archives key LabNet folders into a timestamped .tar.gz file.
# Logs outcome to a local backup-log.txt file.
# -------------------------------

# Set base paths
LABNET_DIR="$HOME/LabNet"
BACKUP_DIR="$LABNET_DIR/archives"
LOG_FILE="$LABNET_DIR/backup-log.txt"
TIMESTAMP=$(date +"%Y%m%d-%H%M")
ARCHIVE_NAME="LabNetBackup_$TIMESTAMP.tar.gz"
DEST_ARCHIVE="$BACKUP_DIR/$ARCHIVE_NAME"

# Folders to back up
FOLDERS=("docs" "logs" "labs")

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Build the list of existing directories to archive
INCLUDE_PATHS=()
for folder in "${FOLDERS[@]}"; do
    FULL_PATH="$LABNET_DIR/$folder"
    if [ -d "$FULL_PATH" ]; then
        INCLUDE_PATHS+=("$FULL_PATH")
    else
        echo "⚠️  Skipping missing folder: $FULL_PATH"
    fi
done

# Perform the archive
if [ ${#INCLUDE_PATHS[@]} -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - ❌ Backup failed: No folders found to archive." >> "$LOG_FILE"
    echo "No valid folders found. Exiting."
    exit 1
fi

tar -czf "$DEST_ARCHIVE" "${INCLUDE_PATHS[@]}" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - ✅ Backup successful: $DEST_ARCHIVE" >> "$LOG_FILE"
    echo "✅ Backup completed: $DEST_ARCHIVE"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - ❌ Backup failed during archive creation." >> "$LOG_FILE"
    echo "❌ Archive failed."
    exit 1
fi
