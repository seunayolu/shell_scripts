#!/bin/bash

echo "#############################################"
date

ls /var/run/apache2/apache2.pid &> /dev/null

if [ $? -eq 0 ]
then
    echo "Apache Webserver is running"
else
    echo "Apache Webserver is not running"
    echo "Starting Apache Webserver"
    sudo systemctl start apache2
    if [ $? -eq 0 ]
    then
          echo "Apache Webserver started successfully"
    else
          echo "Process Failed to start. Contact Admin"
    fi
fi

=================================================================
#!/bin/bash

read -p "Enter the name of the Service/Process: " service

echo "#############################################"
date
if [ -z "$service" ]
then
    echo "Service/Process name cannot be empty"
    exit 1
fi

if [ pgrep -x "$service" &> /dev/null]
then 
    echo "$service is running"
else
    echo "$service is not running"
    echo "Starting $Service"
    sudo systemctl start $service