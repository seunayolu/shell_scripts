#!/bin/bash

# Directory containing the log files
LOG_DIR="/path/to/log/directory"

# Number of days to retain log files
RETENTION_DAYS=7

# Find and delete log files older than the retention period
find "$LOG_DIR" -name "*.log" -type f -mtime +$RETENTION_DAYS -exec rm -f {} \;

# Print a message indicating that log rotation was completed
echo "Log rotation completed. Logs older than $RETENTION_DAYS days have been deleted from $LOG_DIR."
