#!/bin/bash

set -e

echo "########################################"
echo "WARNING: This script will:"
echo "  1. Remove packages: wget, unzip, apache2"
echo "  2. Delete ALL files in /var/www/html/"
echo "########################################"
echo

sudo u

# Prompt user for confirmation
read -p "Type 'YES' to confirm removal: " CONFIRM

if [ "$CONFIRM" != "YES" ]; then
  echo "Operation canceled."
  exit 1
fi

echo "Proceeding with removal..."

# 1. Remove Packages
echo
echo "########################################"
echo "Removing installed packages (wget, unzip, apache2)..."
echo "########################################"
sudo apt remove -y wget unzip apache2

# Optionally remove associated configuration files:
# sudo apt purge -y apache2

# 2. Remove unused dependencies
echo
echo "########################################"
echo "Removing unused dependencies..."
echo "########################################"
sudo apt autoremove -y

# 3. Delete Web Content
echo
echo "########################################"
echo "Deleting files in /var/www/html/"
echo "########################################"
sudo rm -rf /var/www/html/*

echo
echo "########################################"
echo "Cleanup complete!"
echo "########################################"