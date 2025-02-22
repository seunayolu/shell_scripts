#!/bin/bash

# 1. Parse/validate arguments
if [ $# -lt 2 ]; then
  echo "Usage: $0 <DOWNLOAD_URL> <ZIP_FILENAME>"
  echo "Example: $0 \"https://www.tooplate.com/zip-templates/2130_waso_strategy.zip\" \"2133_moso_interior.zip\""
  exit 1
fi

DOWNLOAD_URL=$1
ZIP_FILENAME=$2

# 2. Install Dependencies
echo "########################################"
echo "Installing packages."
echo "########################################"
sudo apt update -y
sudo apt install wget unzip apache2 -y >/dev/null
echo

# 3. Create temp directory and navigate
echo "########################################"
echo "Starting Artifact Deployment"
echo "########################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles || exit 
echo

# 4. Download and unzip artifacts using variables
echo "Downloading from $DOWNLOAD_URL"
wget -q "$DOWNLOAD_URL" -O "$ZIP_FILENAME"
if [ $? -ne 0 ]; then
  echo "Error downloading $DOWNLOAD_URL"
  exit 1
fi

echo "Unzipping $ZIP_FILENAME"
unzip -q "$ZIP_FILENAME"
if [ $? -ne 0 ]; then
  echo "Error unzipping $ZIP_FILENAME"
  exit 1
fi

DEST_FOLDER="2133_moso_interior"

sudo cp -r "$DEST_FOLDER"/* /var/www/html/
echo

# 5. Restart Apache
echo "########################################"
echo "Restarting Apache Webserver service"
echo "########################################"
sudo systemctl restart apache2
echo

# 6. Clean up
echo "########################################"
echo "Removing Temporary Files"
echo "########################################"
rm -rf /tmp/webfiles
echo

# 7. Verify
ls /var/www/html/
sudo systemctl status apache2