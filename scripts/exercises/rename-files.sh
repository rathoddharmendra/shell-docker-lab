#!/bin/bash
# Author: Dee
# Date: 08.04.2026
# Description: Rename multiple files

FILE_LOC='/Users/mac_dee/Documents/Dee/code/shell-docker-lab/scripts/data/old-folders-test'

for filename in $(find $FILE_LOC -type f -name "*.dee")
do
    mv $filename ${filename%.dee}.txt
done