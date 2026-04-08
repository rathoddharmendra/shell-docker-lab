#!/bin/bash
# Author: Dee
# Date: 04.04.2026
# Description: Takes multiple IPs or FQDNs from a file, and prints ping status


# echo "Please pass an IP address: "
HOSTS_FILE='/Users/mac_dee/Documents/Dee/code/shell-docker-lab/data/ip.txt'

for host in $(cat $HOSTS_FILE)
do
    ping -c1 $host &> /dev/null
        if [ $? -eq 0 ] 
        then
            echo "✅ Success - $host is reachable"
        else
            echo "❌ Failed - $host is not reachable"
        fi
done
# makes beep sound once complete
echo -e "\a"
afplay /System/Library/Sounds/Ping.aiff