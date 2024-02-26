#!/bin/bash

# Variable declaration

URL='https://www.tooplate.com/zip-templates/2137_barista_cafe.zip'
TEMPLATE='2137_barista_cafe'
TEMPDIR="/tmp/webfiles"

yum --help &> /dev/null

if [ $? -eq 0 ]
then
	# Set Variable for Amazon Linux
	PACKAGE="httpd wget unzip"
	SVC="httpd"
	
	# Installing Dependencies
	echo "#################################"			
	echo "Installing packages"
	echo "#################################"
	sudo yum install $PACKAGE -y > /dev/null	
	echo

	# Start & Enable Service
	echo "#################################"
	echo "Start & Enable HTTPD Service"
	echo "#################################"
	sudo systemctl start $SVC
	sudo systemctl enable $SVC
	echo

	# Creating Temp Directory
	echo "#################################"
	echo "Setting up the Temp Dir"
	echo "#################################"
	mkdir -p $TEMPDIR
	cd $TEMPDIR
	
	wget $URL > /dev/null
	unzip $TEMPLATE.zip > /dev/null
	sudo cp -r $TEMPLATE/* /var/www/html/
	sudo systemctl restart $SVC
	echo
	
	# Clean up
	echo "#################################"
	echo "Removing Temporary files"
	echo "#################################"
	rm -rf $TEMPDIR
	
else
	# Set Variable for Amazon Linux
	PACKAGE="apache2 wget unzip"
	SVC="apache2"
	
	# Installing Dependencies
	echo "#################################"			
	echo "Installing packages"
	echo "#################################"
	sudo apt update
	sudo apt install $PACKAGE -y > /dev/null	
	echo

	# Creating Temp Directory
	echo "#################################"
	echo "Setting up the Temp Dir"
	echo "#################################"
	mkdir -p $TEMPDIR
	cd $TEMPDIR
	
	wget $URL > /dev/null
	unzip $TEMPLATE.zip > /dev/null
	sudo cp -r $TEMPLATE/* /var/www/html/
	sudo systemctl restart $SVC
	echo
	
	# Clean up
	echo "#################################"
	echo "Removing Temporary files"
	echo "#################################"
	rm -rf $TEMPDIR