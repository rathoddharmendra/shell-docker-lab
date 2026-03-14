#!/bin/bash

# Author: Dee
# Date: 12.03.2026

# Description: Testing i/o for the script

# Declare Variables
h=`hostname`

echo -e "Pass a parameter on $h : \n"
read param
sleep 2
echo "Passed parameters where: $param"

echo $*
# $? 
# $#
# $*
# $@
# $0