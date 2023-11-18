#!/bin/bash

# CentOS
sudo systemctl stop httpd
sudo rm -rf /var/www/html/*
sudo yum remove httpd wget unzip -y

# Ubuntu
#!/bin/bash
sudo systemctl stop apache2
sudo rm -rf /var/www/html/*
sudo apt autoremove apache2 wget unzip -y