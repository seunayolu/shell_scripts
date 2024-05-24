#!/bin/bash

# Source directory to backup
SOURCE_DIR="/path/to/source/directory"

# Backup directory
BACKUP_DIR="/path/to/backup/directory"

# Get the current date and time to create a unique backup folder
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Name of the backup folder
BACKUP_NAME="backup_$TIMESTAMP"

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create a compressed tarball of the source directory and save it to the backup directory
tar -czvf "$BACKUP_DIR/$BACKUP_NAME.tar.gz" "$SOURCE_DIR"

# Print a message indicating that the backup was successful
echo "Backup of $SOURCE_DIR completed successfully!"
echo "Backup saved as $BACKUP_DIR/$BACKUP_NAME.tar.gz"
