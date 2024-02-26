#!/bin/bash
sudo apt-get install -y update
sudo apt-get install -y apache2
sudo echo "<h1>Hello World From $(hostname -f) </h1>"  > /var/www/html/index.html