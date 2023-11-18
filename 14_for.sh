#!/bin/bash

MYUSERS="alpha beta gamma"

PASS="devops"

for usr in $MYUSERS
do 
   echo "Adding user $usr."
   useradd $usr
   passwd $PASS
   id $usr
   echo "#####################################"
done

