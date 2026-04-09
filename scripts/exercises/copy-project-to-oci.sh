#!/bin/bash
# Author: Dee
# Date: 09.04.2026
# Description: Assigns executable permissions to all script files, and copies projects to remote oracle cloud servers


ROOT_FOLDER='/Users/mac_dee/Documents/Dee/code/shell-docker-lab/'

# Assign permissions
cd $ROOT_FOLDER
make set-local-perm

# Dummy servers names
servers=`cat /Users/mac_dee/Documents/Dee/code/shell-docker-lab/scripts/data/hostnames`

for server in $servers
do
    # scp -i ~/.ssh/oci-ssh-key.key -r $ROOT_FOLDER opc@$server:~/project/
    rsync -avz -e "ssh -i ~/.ssh/oci-ssh-key.key" "$ROOT_FOLDER" opc@$server:~/shell-docker-lab/
done
