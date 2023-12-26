#!/bin/bash

# Creating Temp Directory
echo "########################################"
echo "Starting Artifact Deployment"
echo "########################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://www.tooplate.com/zip-templates/2133_moso_interior.zip > /dev/null
unzip 2133_moso_interior.zip > /dev/null
sudo cp -r 2133_moso_interior/* /var/www/apache2.np.dev.darey.io/
echo

# Bounce Service
echo "########################################"
echo "Restarting Apache Webserver service"
echo "########################################"
systemctl restart apache2
echo

# Clean Up
echo "########################################"
echo "Removing Temporary Files"
echo "########################################"
rm -rf /tmp/webfiles
echo

ls /var/www/apache2.np.dev.darey.io/
sudo systemctl status apache2
