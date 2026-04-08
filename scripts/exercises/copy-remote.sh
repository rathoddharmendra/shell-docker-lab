#!/bin/bash
# Author: Dee
# Date: 04.04.2026
# Description: Copies file to remote servers
ROOT_FOLDER='/Users/mac_dee/Documents/Dee/code/shell-docker-lab/scripts'
# Dummy servers names
servers=`cat /Users/mac_dee/Documents/Dee/code/shell-docker-lab/scripts/data/hostnames`
for server in $servers
do
    scp -i ~/.ssh/oci-ssh-key.key $ROOT_FOLDER/data/backup.tar.gz opc@$server:~/
done
