#!/bin/bash

# Script to update server and pull latest API changes
LOG_FILE="/var/log/update.log"
REPO_DIR="/home/ubuntu/cs421_Assignment"

echo "--------------------------------------" >> "$LOG_FILE"
echo "[$(date '+%F %T')] Update started" >> "$LOG_FILE"

# Step 1: Update package lists and upgrade
if sudo apt update && sudo apt upgrade -y >> "$LOG_FILE" 2>&1; then
  echo "[$(date '+%F %T')] System packages updated successfully" >> "$LOG_FILE"
else
  echo "[$(date '+%F %T')] System update FAILED" >> "$LOG_FILE"
fi

# Step 2: Pull latest changes from GitHub
cd "$REPO_DIR" || { echo "[$(date '+%F %T')] Could not find repo directory" >> "$LOG_FILE"; exit 1; }

if git pull origin main >> "$LOG_FILE" 2>&1; then
  echo "[$(date '+%F %T')] Git pull successful" >> "$LOG_FILE"
else
  echo "[$(date '+%F %T')] Git pull FAILED. Aborting update." >> "$LOG_FILE"
  exit 1
fi

# Step 3: Restart the web server
if sudo systemctl restart nginx >> "$LOG_FILE" 2>&1; then
  echo "[$(date '+%F %T')] Web server restarted successfully" >> "$LOG_FILE"
else
  echo "[$(date '+%F %T')] Failed to restart web server" >> "$LOG_FILE"
fi

echo "[$(date '+%F %T')] Update completed" >> "$LOG_FILE"
echo "--------------------------------------" >> "$LOG_FILE"
