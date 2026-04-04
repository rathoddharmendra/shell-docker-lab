#!/bin/bash

# Author: Dee
# Date: 14.03.2026

# Description: Playing with loops, and various ways to use them

# Define Variables
uptime | awk -F: '{print $2}'

while [ "$(uptime | awk -F: '{print $2}')" == 58 ]
do 
    echo "It's not time yet"
    sleep 2
done

count=0
while [ $count -lt 5 ]
do
    echo ---$?
    count=`expr $count + 1`
    # (($c++ ))
done

count=10
while [ $count -gt 0 ]
do
    echo countdown 🙏🏻 $count
    count=`expr $count - 1` # I like this expression
    # $(( $count - 1 ))
    sleep 1
done