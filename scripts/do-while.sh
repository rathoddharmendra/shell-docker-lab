#!/bin/bash

# Author: Dee
# Date: 14.03.2026

# Description: Playing with loops, and various ways to use them

# Define Variables


while [ "uptime | awk -F: '{print $2}'" == 52 ]
do 
    echo "It's not time yet"
    sleep 2
done