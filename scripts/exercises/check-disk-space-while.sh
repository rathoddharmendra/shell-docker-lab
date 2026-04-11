#!/bin/bash
# Author: Dee
# Date: 11.04.2026
# Description: Takes multiple IPs or FQDNs from a file, and prints ping status


df -H | egrep -vE "private|cd|tmp" | tail -n+2 | awk '{print $5,$9}' | while read output
do
    usage=$(echo $output | awk '{print $1}' | cut -d "%" -f 1)
    partition=$(echo $output | awk '{print $2}' | cut -d "%" -f 1)

    if [ $usage -gt 70 ]
    then
        echo "⛔️ $partition is running out of space on host - $(hostname) as on $(date). Current space usage is $usage"
    fi
done