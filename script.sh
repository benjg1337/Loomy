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

#Results with nice formatting
echo "====================================="
echo "System Uptime:"
echo "====================================="
echo "$uptime_output"
echo
echo "====================================="
echo "Scheduled Tasks (Crontab):"
echo "====================================="
echo "$crontab_output"
echo
echo
# Print the captured output
echo "Active Network Connections:"
echo "====================================="
echo "$netstat_output"
echo
echo
# Print formatted output
echo "System Information:"
echo "====================================="
echo "Kernel Version:    $kernel_version"
echo "Operating System:  $os_version"
echo "Memory Total:      $mem_total"
echo
echo
# Print the list of logged-in users
echo "Currently Logged-In Users:"
echo "====================================="
echo "$who_output"
echo
echo
# Print logged in users within the last 7 days
echo "===================================================="
echo "Users Logged In Within the Last 7 Days:"
echo "===================================================="
echo
echo
#Print if there are any logins
if [ -z "$logins" ]; then
    echo "No users have logged in within the last 7 days."
else
    echo "$logins"
fi
echo "===================================================="
echo
echo
# Print logged in users via SSH
echo "Users Logged In via SSH:"
echo "===================================================="
echo "$ssh_logins"
echo "===================================================="
echo
echo
# Print failed logged in users via SSH
echo "===================================================="
echo "Failed logins via SSH"
echo "===================================================="
echo "$ssh_failed_logins"
echo "===================================================="
echo
echo
# Print the captured history output
echo "Last 50 Lines of Bash History:"
echo "=============================="
echo "$history_output"
echo
