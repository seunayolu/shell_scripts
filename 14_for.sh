#!/bin/bash

USERS="seun dammy bisi tope"

for admin in $USERS

do
  echo "Adding User....."
  sleep 2
  echo "###################################################"
  useradd $admin
  id $admin
  echo "###################################################"
  date
  echo
done

