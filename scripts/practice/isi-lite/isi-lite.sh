############################################################
#!/bin/bash
# Author: Dee
# Date: Sat Apr 11 12:46:08 CEST 2026
# Description: Isilon custom utility to manage cluster health
############################################################

COMMAND=$1


echo "What would you like to check?"
echo "a) Node status"
echo "b) Performance stats"
echo "c) snapshot"

read -p "Enter your selection: " choice

case $choice in
    a) ./status.sh ;;
    *) echo Invalid choice - bye!
esac