#!/bin/bash
# Author: Dee
# Date: 09.04.2026
# Description: Assigns executable permissions to all script files, and copies projects to remote oracle cloud servers


ROOT_FOLDER='/Users/mac_dee/Documents/Dee/code/shell-docker-lab/'

# Dummy servers names
servers=`cat /Users/mac_dee/Documents/Dee/code/shell-docker-lab/scripts/data/hostnames`

for server in $servers
do
    # scp -i ~/.ssh/oci-ssh-key.key -r $ROOT_FOLDER opc@$server:~/project/
    rsync -avz -e "ssh -i ~/.ssh/oci-ssh-key.key" "$ROOT_FOLDER" opc@$server:~/shell-docker-lab/
    # rsync -avz -e "ssh -i ~/.ssh/oci-ssh-key.key -o ControlMaster=auto -o ControlPath=~/.ssh/socket-%r@%h:%p -o ControlPersist=600" "$ROOT_FOLDER" opc@$server:~/shell-docker-lab/

    # Check if the last command succeeded
    if [ $? -eq 0 ]; then
        echo "✅ $server sync'd successfully."
    else
        echo "❌ $server failed."
    fi
    
    sleep 1 # A 1-second breather prevents MaxStartups issues
    
done
