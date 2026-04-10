#!/bin/bash
# Author: Dee
# Date: 08.04.2026
# Description: This script deletes files older than 90 days


inactive_users=`lastlog | tail -n+2 | grep -i 'dee' | awk '{print $1}'`

for users in $inactive_users
do
    echo $users
    sudo usermod -L $users
done