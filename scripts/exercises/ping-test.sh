#!/bin/bash

# Author: Dee
# Date: 04.04.2026
# Description: Takes IP or FQDN from users, and prints ping status


# echo "Please pass an IP address: "
host='www.google.com'

ping -c1 $host &> /dev/null
    if [ $? -eq 0 ] 
    then
        echo "Success - $host is reachable"
    else
        echo "Failed - $host is not reachable"
    fi

