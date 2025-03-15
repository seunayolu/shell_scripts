#!/bin/bash

echo "#####################################################"
date 
ls /var/run/httpd/httpd.pid &> /dev/null

if [ $? -eq 0 ]
then
   echo "Httpd process is running."
else
   echo "Httpd process is NOT Running."
   echo "Starting the process"
   systemctl start httpd 
   if [ $? -eq 0 ]
   then
      echo "Process started successfully."
   else
      echo "Process Starting Failed, contact the admin."
   fi
fi
echo "#####################################################"
echo 

===============================================================
Ubuntu

#!/bin/bash
#
echo "###########"
date

# ls /var/run/apache2/apache2.pid &> /dev/null

if [ -f /var/run/apache2/apache2.pid ]
then
        echo "Apache 2 Service is running"
else
        echo "Apache 2 Service is NOT running"
        echo "Starting Apache 2 Service"
        sudo systemctl start apache2

        if [ $? -eq 0 ]
        then
                echo "Process Started Successfully"
        else
                echo "Process Failed to Start. Contact Admin"
        fi

fi