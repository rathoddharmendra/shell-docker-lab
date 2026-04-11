#!/bin/bash
# Author: Dee
# Date: 04.04.2026
# Description: Takes multiple IPs or FQDNs from a file, and prints ping status


disks_usage=`df -h | egrep -v "tmp"| tail -n+2 | awk '{print $5}' | cut -d "%" -f 1`

for disk in $disks_usage
do
    if [ $disk -gt 20 ]
    then
        echo "$disk% is above threshold of 20% on disk $(df -h | grep $disk | awk '{print $6}')" 
    fi
done