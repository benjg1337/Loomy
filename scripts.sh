#!/bin/bash

# Run uptime command and store the output
uptime_output=$(uptime)

# Run crontab -l command and store the output
crontab_output=$(crontab -l 2>&1)

# Run netstat -tulpn and capture the output into a variable
netstat_output=$(netstat -tulpn)

# Kernel version
kernel_version=$(uname -r)

# Operating system version
os_version=$(cat /etc/*release | grep PRETTY_NAME | cut -d "=" -f 2- | tr -d '"')

# Memory information
mem_total=$(grep MemTotal /proc/meminfo | awk '{print $2/1024/1024 " GB"}')

# Use who command to get list of logged-in users
who_output=$(who)

# Get the current date
current_date=$(date +%Y-%m-%d)

# Calculate the date 7 days ago
seven_days_ago=$(date -d "7 days ago" +%Y-%m-%d)

# Use the last command to find logins between seven days ago and now
logins=$(last -F -s $seven_days_ago | grep -v "^reboot" | grep -v "^wtmp" | grep -v "^$current_date" | awk '{print $1}' | sort | uniq)

# Read last 50 lines of bash history into a variable
history_output=$(tail -n 50 ~/.bash_history)

# Read accepted password logins from journalctl
ssh_logins=$(journalctl -u ssh | grep 'sshd.*Accepted password' | tail -n 20)

# Read accepted password logins from journalctl
ssh_failed_logins=$(journalctl -u ssh | grep 'sshd.*Failed password' | tail -n 20)

# show all installed packages on Arch Debian or RHEL based distros 
head -n 200 /var/log/apt/history.log 2>/dev/null | grep -oP 'Commandline: \K.*' ; head -n 200 /var/log/apt/yum.log 2>/dev/null | grep -oP 'Commandline: \K.*' ; head -n 200 /var/log/apt/dnf.log 2>/dev/null | grep -oP 'Commandline: \K.*' ; head -n 200 /var/log/apt/pacman.log 2>/dev/null | grep -oP 'Commandline: \K.*'

# show all running Docker and Podman containers 
(command -v docker &>/dev/null && docker ps) || (command -v podman &>/dev/null && podman ps)

#Print if there are any logins
if [ -z "$logins" ]; then
    echo "No users have logged in within the last 7 days."
else
    echo "$logins"
fi

