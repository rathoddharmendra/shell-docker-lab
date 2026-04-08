#!/bin/bash
# Author: Dee
# Date: 08.04.2026
# Description: This script deletes files older than 90 days




OLD_FOLDER="/Users/mac_dee/Documents/Dee/code/shell-docker-lab/data/old-folders"

find $OLD_FOLDER -mtime +90 -type f -exec echo {} \;
# find $OLD_FOLDER -mtime +90 -type f -exec mv {} {}.old \;