#!/bin/bash

BACKUP_DIR="/home/ubuntu/backups"
API_SOURCE="/home/ubuntu/cs421_Assignment"
DB_BACKUP="$BACKUP_DIR/db_backup_$(date +%F).sql"
API_BACKUP="$BACKUP_DIR/api_backup_$(date +%F).tar.gz"
LOG_FILE="/var/log/backup.log"

mkdir -p "$BACKUP_DIR"

{
    echo "[ $(date '+%Y-%m-%d %H:%M:%S') ] Backup started"
    
    # Backup API files
    tar czvf "$API_BACKUP" "$API_SOURCE"
    if [ $? -eq 0 ]; then
        echo "[ $(date '+%Y-%m-%d %H:%M:%S') ] API backup successful: $API_BACKUP"
    else
        echo "[ $(date '+%Y-%m-%d %H:%M:%S') ] API backup FAILED"
    fi

    # Backup Database
    PGPASSWORD=12345 pg_dump -U postgres -h 127.0.0.1 -d students_db > "$DB_BACKUP"
    if [ $? -eq 0 ]; then
        echo "[ $(date '+%Y-%m-%d %H:%M:%S') ] DB backup successful: $DB_BACKUP"
    else
        echo "[ $(date '+%Y-%m-%d %H:%M:%S') ] DB backup FAILED"
    fi

    # Delete backups older than 7 days
    find "$BACKUP_DIR" -type f -mtime +7 -exec rm {} \;
    echo "[ $(date '+%Y-%m-%d %H:%M:%S') ] Old backups deleted if any (older than 7 days)"
    echo "[ $(date '+%Y-%m-%d %H:%M:%S') ] Backup completed"
    echo "--------------------------------------"

} >> "$LOG_FILE" 2>&1
