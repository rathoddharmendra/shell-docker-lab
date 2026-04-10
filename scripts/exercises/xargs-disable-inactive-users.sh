#!/bin/bash
# Author: Dee
# Date: 08.04.2026
# Description: This script deletes files older than 90 days

lastlog | tail -n+2 | grep -i 'dee' | awk '{print $1}' | xargs -I{} sudo usermod -L {}
# lastlog | tail -n+2 | grep -i 'dee' | awk '{print $1}' | xargs -I{} sudo usermod -U {} # unlocks user account

