#!/bin/bash

USR='devops'

for host in `cat remhosts`
do
   echo
   echo "#########################################################"
   echo "Connecting to $host"
   echo "Pushing Script to $host"
   scp dismantle_ifelse.sh $USR@$host:/tmp/
   echo "Executing Script on $host"
   ssh $USR@$host sudo /tmp/dismantle_ifelse.sh
   ssh $USR@$host sudo rm -rf /tmp/dismantle_ifelse.sh
   echo "#########################################################"
   echo
done 
