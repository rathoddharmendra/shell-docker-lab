#!/bin/bash
# Author: Dee
# Date: 04.04.2026
# Description: Check unowned home directories

cd ~

for DIR in *
do
    # ls $DIR
    CHK=$(grep -c "/home/$DIR" /etc/passwd)
    if [ $CHK -ge 1 ]
        then  
            echo "$DIR is fine"
        else    
            echo "$DIR can be removed"
    fi
done