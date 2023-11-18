#!/bin/bash

yum --help &> /dev/null

if [ $? -eq 0 ]
then

    # Set Variables for Amazon Linux
    PACKAGE="httpd wget unzip"
    SVC="httpd"

    echo " Removing Every Setup"
    echo

    sudo systemctl stop $SVC
    sudo rm -rf /var/www/html/*
    sudo yum remove $PACKAGE -y

else

    # Set Variables for Ubuntu
    PACKAGE="apache2 wget unzip"
    SVC="apache2"

    echo " Removing Every Setup"
    echo

    sudo systemctl stop $SVC
    sudo rm -rf /var/www/html/*
    sudo apt autoremove $PACKAGE -y

fi

