#!/bin/bash

# Author: Dee
# Date: 12.03.2026

# Description: Checking Unix command utilities on dokken/centos-stream-9 sourced image

# Define Variables

echo "Please choose an option from below:"

echo 
echo "a = Display hostname"
echo "b = Display IP addresses"
echo "c = Display current working directory path"
echo "d = List files and directories"

read choice

    case $choice in
        a) hostname ;;
        b) ip addr ;;
        c) pwd ;;
        d) ls -lst ;;
        *) echo Invalid choice - Bye

    esac