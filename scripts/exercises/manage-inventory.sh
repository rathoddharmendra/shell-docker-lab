#!/bin/bash
# Author: Dee
# Date: 11.04.2026
# Description: Assigns executable permissions to all script files, and copies projects to remote oracle cloud servers

clear 
echo """
***************** SYSTEM INVENTORY MANAGEMENT UTILITY **********************
⏿ Allows to manage server records in the central system invetory
To add or delete a server records, please pass the following information

"""

read -p "Would you like to add (a) or delete (d) a server record? " option

case $option in 
    a) ./create-inventory.sh ;;
    d) ./delete-inventory.sh ;;
    *) echo "Wrong choice - Bye!"
esac


