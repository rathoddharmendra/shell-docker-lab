#!/bin/bash
# Author: Dee
# Date: 04.04.2026
# Description: Takes multiple IPs or FQDNs from a file, and prints ping status
ROOT_FOLDER='/Users/mac_dee/Documents/Dee/code/shell-docker-lab/scripts'

tar cvf $ROOT_FOLDER/data/backup.tar $ROOT_FOLDER
gzip $ROOT_FOLDER/data/backup.tar

find $ROOT_FOLDER/data/backup.tar.gz -mtime -1 -type f -print &> /dev/null

if [ $? -eq 0 ]
then 
    echo "Backup was created"
    echo
    echo "Archiving Backup to another location"
    scp -i ~/.ssh/oci-ssh-key.key $ROOT_FOLDER/data/backup.tar.gz opc@89.168.102.141:~/

else
    echo "Backup failed for $(date)"
fi
