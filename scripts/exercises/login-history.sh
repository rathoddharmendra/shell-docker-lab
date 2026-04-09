#!/bin/bash
# Author: Dee
# Date: 04.04.2026
# Description: Copies file to remote servers


today=($(date | awk '{print $1,$2,$3}'))

last | grep "$today[]"