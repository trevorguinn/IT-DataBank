🧪 Usage
Save as: labnet-backup.sh in your ~/LabNet/scripts/ directory

## Make it executable:
chmod +x ~/LabNet/scripts/labnet-backup.sh

## Run manually:
~/LabNet/scripts/labnet-backup.sh

## Optional: Automate with cron
To back up daily at 11:00 PM:

crontab -e

Add: 0 23 * * * /home/username/LabNet/scripts/labnet-backup.sh
