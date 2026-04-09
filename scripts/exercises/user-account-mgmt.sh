#!/bin/bash
# Author: Dee
# Date: 04.04.2026
# Description: Takes multiple IPs or FQDNs from a file, and prints ping status

# read user requirements

read -p "Please provide a username: " username
read -p "Please provide a user description: " description
read -p "[ Optional ] Do you want to provide a user UID (y/n)? " is_uid



# error out if user already exists
    # create user account
    # add user metadata - like description

sudo cat /etc/passwd | grep -q $username
if [ $? -eq 1 ]
then
    sudo useradd $username -c "$description"
    sudo cat /etc/passwd | grep -q $username
    if [ $? -eq 0 ]; then echo "$username has been created"; else     echo "Something failed - run this command 'sudo cat /etc/passwd | grep -i $username' to see if user exists"; fi
else
    echo "Error - $username already exists"
    exit 0
fi



# used with ID option
    # error out - if user exists

# add priviledges - to group, give sudo access etc..


