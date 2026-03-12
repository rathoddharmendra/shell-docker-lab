#!/bin/bash

# comments to add

echo $SHELL

echo "Hello from CentOS container"
echo "Current user: $(whoami)"
echo "Date: $(date)"

echo "OS: $(cat /etc/os-release | head -1)"