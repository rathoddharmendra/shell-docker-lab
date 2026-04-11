############################################################
#!/bin/bash
# Author: Dee
# Date: Sat Apr 11 12:51:30 CEST 2026
# Description: No description provided.
############################################################

# Add banner here

for node in nodes/*
do
    source "$node/status.conf"
    # echo "$node: $STATUS, CPU: $CPU, DISK: $DISK"
    if [ $DISK -gt 80 ]; then 
        echo "$(basename $node): WARNING - 💿 DISK HIGH (CPU: $CPU%, DISK: $DISK%)"
    elif [ $STATUS == 'DOWN' ]; then
        echo "$(basename $node): CRITICAL - ❌ NODE DOWN (CPU: $CPU%, DISK: $DISK%)"
    else
        echo "$(basename $node): $STATUS (CPU: $CPU%, DISK: $DISK%)"
    fi
done