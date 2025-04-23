#!/bin/bash

LOG_FILE="/var/log/server_health.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
API_BASE_URL="http://127.0.0.1:8000/api"

echo "[$TIMESTAMP] Starting health check..." >> "$LOG_FILE"

# Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "[$TIMESTAMP] CPU Usage: $CPU_USAGE%" >> "$LOG_FILE"

# Check Memory usage
MEMORY_USAGE=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')
echo "[$TIMESTAMP] Memory Usage: $MEMORY_USAGE%" >> "$LOG_FILE"

# Check Disk usage
DISK_USAGE=$(df / | awk 'END{print $5}' | sed 's/%//')
echo "[$TIMESTAMP] Disk Usage: $DISK_USAGE%" >> "$LOG_FILE"
if [ "$DISK_USAGE" -gt 90 ]; then
    echo "[$TIMESTAMP] WARNING: Disk usage is above 90%!" >> "$LOG_FILE"
fi

# Check if Nginx is running
if systemctl is-active --quiet nginx; then
    echo "[$TIMESTAMP] Nginx is running." >> "$LOG_FILE"
else
    echo "[$TIMESTAMP] WARNING: Nginx is not running!" >> "$LOG_FILE"
fi

# Check if Apache is running
if systemctl is-active --quiet apache2; then
    echo "[$TIMESTAMP] Apache2 is running." >> "$LOG_FILE"
else
    echo "[$TIMESTAMP] Apache2 is not running (may not be installed)." >> "$LOG_FILE"
fi

# Function to check endpoint status
check_endpoint() {
    ENDPOINT=$1
    STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}" "$API_BASE_URL/$ENDPOINT/")
    if [ "$STATUS_CODE" -eq 200 ]; then
        echo "[$TIMESTAMP] $ENDPOINT endpoint is OK (200)." >> "$LOG_FILE"
    else
        echo "[$TIMESTAMP] WARNING: $ENDPOINT endpoint returned status $STATUS_CODE!" >> "$LOG_FILE"
    fi
}

check_endpoint "students"
check_endpoint "subjects"

echo "[$TIMESTAMP] Health check complete." >> "$LOG_FILE"
echo "----------------------------------------" >> "$LOG_FILE"
