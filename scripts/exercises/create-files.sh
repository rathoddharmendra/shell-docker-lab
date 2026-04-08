#!/bin/bash
# Author: Dee
# Date: 08.04.2026
# Description: Create multiple files with user input

FILE_LOC='/Users/mac_dee/Documents/Dee/code/shell-docker-lab/scripts/data/old-folders-test'

read -p  "How many files do you want to create: " file_count # using simple syntax
echo "What suffix do you want to add: "
read file_suffix

for file in $(seq 1 $file_count)
do
    touch "$FILE_LOC/$file_suffix-$file.dee"
    chmod a+x "$FILE_LOC/$file_suffix-$file.dee"
done