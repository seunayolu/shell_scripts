#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Where Apache logs are stored
APACHE_LOG_DIR="/var/log/apache2"

# Where we want to store backups
BACKUP_DIR="/var/backups/apache2"

# Create backup directory if it does not exist
mkdir -p "$BACKUP_DIR"

# Get a timestamp for the backup filename: e.g. 20250222_153015
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Construct the backup file name
BACKUP_FILE="$BACKUP_DIR/apache2_logs_$TIMESTAMP.tar.gz"

# Create the archive of all Apache logs
tar -czf "$BACKUP_FILE" -C "$APACHE_LOG_DIR" .

# Optionally, remove old backups or logs beyond a certain age:
# find "$BACKUP_DIR" -type f -name "apache2_logs_*.tar.gz" -mtime +7 -delete

echo "Apache logs backed up to: $BACKUP_FILE"
