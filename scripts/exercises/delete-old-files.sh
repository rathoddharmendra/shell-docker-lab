#!/bin/bash
# Author: Dee
# Date: 08.04.2026
# Description: This script deletes files older than 90 days

OLD_FOLDER="/Users/mac_dee/Documents/Dee/code/shell-docker-lab/scripts/data/old-folders-test"

# create files
# cd $OLD_FOLDER

# for file in {1..10}
# do 
#     # create old timestamp files
#     touch -d "2025-12-11T02:02:12" $file.log
# done

ls

# Take action with found files
# find $OLD_FOLDER -mtime +90 -type f -exec echo {} \;
# find $OLD_FOLDER -mtime +90 -type f -exec mv {} {}.old \;
echo "Deleting files..."
# find $OLD_FOLDER -mtime +90 -type f -exec rm {} \;
find $OLD_FOLDER -type f -exec rm {} \;
sleep 2
echo "✅ Cleaned"