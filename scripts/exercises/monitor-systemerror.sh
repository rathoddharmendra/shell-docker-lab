#!/bin/bash
# Author: Dee
# Date: 04.04.2026
# Description: Reads system logs in real time, and filters out error messages

SYSTEM_LOG_FILE='/var/log/messages'

tail -fn0 $SYSTEM_LOG_FILE | while read line
do
echo $line | egrep -i "refused|invalid|error|fail|lost|shut|down|offline"
    if [ $? -eq 0 ]
    then
        echo $line >> /tmp/filtered-error-messages.log
    fi
done