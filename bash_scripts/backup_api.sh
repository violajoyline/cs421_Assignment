#!/bin/bash

# === CONFIG ===
BACKUP_DIR="/home/ubuntu/backups"
API_DIR="/home/ubuntu/cs421_Assignment"  
DB_NAME="students_db"       
DB_USER="postgres"
LOG_FILE="/var/log/backup.log"
DATE=$(date +%F)
TIME=$(date +"%Y-%m-%d %H:%M:%S")

# === Ensure backup folder exists ===
mkdir -p "$BACKUP_DIR"

# === Start log entry ===
echo "[$TIME] Backup started" >> "$LOG_FILE"

# === Backup API project ===
API_BACKUP="$BACKUP_DIR/api_backup_$DATE.tar.gz"
tar -czf "$API_BACKUP" "$API_DIR" 2>> "$LOG_FILE"
if [ $? -eq 0 ]; then
  echo "[$TIME] API backup successful: $API_BACKUP" >> "$LOG_FILE"
else
  echo "[$TIME] API backup FAILED" >> "$LOG_FILE"
fi

# === Backup PostgreSQL DB ===
DB_BACKUP="$BACKUP_DIR/db_backup_$DATE.sql"
PGPASSWORD="12345" pg_dump -U "$DB_USER" -F p "$DB_NAME" > "$DB_BACKUP" 2>> "$LOG_FILE"
if [ $? -eq 0 ]; then
  echo "[$TIME] DB backup successful: $DB_BACKUP" >> "$LOG_FILE"
else
  echo "[$TIME] DB backup FAILED" >> "$LOG_FILE"
fi

# === Delete old backups (> 7 days) ===
find "$BACKUP_DIR" -type f -mtime +7 -name "*.tar.gz" -delete
find "$BACKUP_DIR" -type f -mtime +7 -name "*.sql" -delete

echo "[$TIME] Old backups deleted if any (older than 7 days)" >> "$LOG_FILE"
echo "[$TIME] Backup completed" >> "$LOG_FILE"
echo "--------------------------------------" >> "$LOG_FILE"
