#!/bin/bash

# Author: Dee
# Date: 12.03.2026

# Description: Running decision based conditions on shell

# Define Variables

echo Enter a number
read count


    if [ $count -eq 100 ]
    # if [ $count == 'y' ]
    # if [ -e /scripts/scripts/format.sh ]
    then
        echo count is 100
    else
        echo count is not equal to 100
    fi