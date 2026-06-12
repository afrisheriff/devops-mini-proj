#!/bin/bash

# Variables
BACKUP_DIR="/home/ubuntu/devops-mini-proj/backups"
LOG_DIR="/var/log"
DATE=$(date +%Y-%m_%d)
BACKUP_FILE="$BACKUP_DIR/logs_$DATE.tar.gz"

#Create backup directory if not exists
mkdir -p $BACKUP_DIR

echo "Starting backup..."

# Backup logs
tar -czf $BACKUP_FILE $LOG_DIR

echo "Backup completed: $BACKUP_FILE"

#System Monitoring
echo "System Monitoring Report:" >> report.txt
echo "Date: $DATE" >> report.txt

echo "CPU Usage:" >> report.txt
top -bn1 | grep "Cpu(s)" >> report.txt

echo "Memory Usage:" >> report.txt
free -h >> report.txt

echo "Disk Usage:" >> report.txt
df -h >> report.txt

echo "-----------------------" >> report.txt

#Delete backups older than 7 days
find $BACKUP_DIR -type f -mtime +7 -delete

echo "Old backups cleaned!"
