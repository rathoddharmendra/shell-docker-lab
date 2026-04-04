#!/bin/bash

# Author: Dee
# Date: 04.04.2026
# Description: Takes date range from users, and prints logged in users


echo "Please enter a date range in"
read day
echo "Please enter a date range in"
read month
echo "Please enter a date range in"
read user_date
# today=`date | awk '{print $1 $2 $3}'`

last | grep "$day $month  $user_date" | awk '{print $1}' | sort -u
