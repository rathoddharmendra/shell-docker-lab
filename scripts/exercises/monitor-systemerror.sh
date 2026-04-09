#!/bin/bash
# Author: Dee
# Date: 04.04.2026
# Description: Reads system logs in real time, and filters out error messages. Later, send alerts to IT via mail relay

SYSTEM_LOG_FILE='/var/log/messages'

sudo tail -fn0 $SYSTEM_LOG_FILE | while read line
do
echo $line | egrep -i "refused|invalid|error|fail|lost|shut|down|offline"
    if [ $? -eq 0 ]
    then
        echo $line >> /tmp/filtered-error-messages.log
    fi
done

# to send it to IT

$IT='mail@IT.com,mail-2@IT.com'

if [ -s /tmp/filtered-error-messages.log ]
then    
    cat /tmp/filtered-error-messages.log | sort | uniq | mail -s "Syslog Errors" $IT
    rm /tmp/filtered-error-messages.log
else
fi