#!/bin/bash
apt-get update
apt-get install -y update
apt-get install -y apache2
echo "<h1>Hello World From $(hostname -f) </h1>"  > /var/www/html/index.html