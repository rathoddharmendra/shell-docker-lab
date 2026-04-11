#!/bin/bash
# Author: Dee
# Date: 09.04.2026
# Description: Assigns executable permissions to all script files, and copies projects to remote oracle cloud servers

DATABASE='../data/database/inventory.txt'

check_existing_inventory() {
    local arg_value=$1
    local value_name=$2
    grep -q "$arg_value" $DATABASE
    if [ $? -eq 0 ]
    then
        echo "⛔️ Error - $value_name already exists in inventory"
        exit 1
    fi
}

clear 
echo """
***************** SYSTEM INVENTORY MANAGEMENT UTILITY **********************
⏿ Allows to add new servers into the central system invetory
To add new server, please pass the following information

"""
read -p "Please enter a hostname? " host_name
check_existing_inventory "$host_name" "hostname"

read -p "Please enter IP address? " host_ip
check_existing_inventory "$host_ip" "IP address"


read -p "Please enter description for the host? " description

echo $host_name $host_ip $description >> $DATABASE
echo "Successfully added $host_name to system inventory"

