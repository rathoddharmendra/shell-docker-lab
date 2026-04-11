#!/bin/bash
# Author: Dee
# Date: 09.04.2026
# Description: Assigns executable permissions to all script files, and copies projects to remote oracle cloud servers

DATABASE='../data/database/inventory.txt'

delete_existing_host_record() {
    local arg_value=$1
    grep -q "$arg_value" $DATABASE
    if [ $? -eq 0 ]
    then
        # delete here
        sed -i "/$arg_value/d" "$DATABASE"
        if [ $? -eq 0 ]; then echo "Successfully removed $arg_value from system inventory" ; fi
        exit 0
    else
        echo "⛔️ Error - Cannot find host: $arg_value in the central inventory"
        exit 1
    fi
}

clear 
echo """
***************** SYSTEM INVENTORY MANAGEMENT UTILITY **********************
⏿ Allows users to delete host records from the central system invetory
To delete a server entry, please pass the following information

"""

# MAIN
read -p "Please enter a hostname or ip address to delete a record? " host_or_ip
delete_existing_host_record "$host_or_ip"



