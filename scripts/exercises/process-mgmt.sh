

#!/bin/bash

# Author: Dee
# Date: 04.04.2026
# Description: Kill zombie processs


# there are many commands to manage Process
# "ps top htop pgrep pkill kill killall nice renice strace lsof free vmstat iostat sar uptime shutdown reboot halt poweroff systemctl service telinit runlevel

ps -ef | grep -i "sleep" | grep -v grep | awk '{print $2}' | xargs -I{} kill -9 {}