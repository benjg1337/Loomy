#!/bin/bash

# Function to display the ASCII art message
show_ascii_art() {
    echo "______                                 "
    echo "___  / ___________________ ________  __"
    echo "__  /  _  __ \  __ \_  __ \__ \_  / / /"
    echo "_  /___/ /_/ / /_/ /  / / / / /  /_/ / "
    echo "/_____/\____/\____//_/ /_/ /_/_\__, /  "
    echo "                              /____/   "
}

# Function to display the menu
show_menu() {
    echo "1) Option 1: Show System Information"
    echo "2) Option 2: Show Crontab (Scheduled tasks)"
    echo "3) Option 3: Current open and used ports via Netstat"
    echo "4) Option 4: Running kernel version"
    echo "5) Option 5: OS Version installed"
    echo "6) Option 6: Altered files in /Home & /Opt"
    echo "7) Option 7: Recently Installed Packages"
    echo "8) Option 8: List Running Docker/Podman containers"
    echo "9) Option 9: Formatted packet capture (60 seconds)"
    echo "10) Option 10: Last 7 days of local logins"
    echo "11) Option 11: "
    echo "12) Option 12: "
    echo "13) Option 13: Last 20 lines of command history"
    echo "14) Option 14: Exit"
}

# Function to handle user input and perform actions
read_input() {
    local choice
    read -p "Enter choice [1-14]: " choice
    case $choice in
        1)
            system_info
            ;;
        2)
            show_crontab
            ;;
        3)
            netstat_output
            ;;
        4)
            kernel_version
            ;;
        5)
            distro_version
            ;;
        6)
            directory_changes
            ;;
        7)
            installed_packages
            ;;
        8)
            list_containers
            ;;
        9)
            network_capture
            ;;
        10)
            local_logins
            ;;
        11)
            ssh_auths
            ;;
        12)
            failed_ssh_auths
            ;;
        13)
            bash_history
            ;;
        14)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice, please try again."
            ;;
    esac
}

# Functions for each menu option
system_info() {
    clear
    uptime && grep MemTotal /proc/meminfo | awk '{print $2/1024/1024 " GB"}' 
    read -p "Press [Enter] key to return to main menu..."
}

show_crontab() {
    clear
    crontab -l 2>&1
    read -p "Press [Enter] key to return to main menu..."
}

netstat_output() {
    netstat -tulpn
    read -p "Press [Enter] key to return to main menu..."
}

kernel_version() {
    clear
    uname -r 
    read -p "Press [Enter] key to return to main menu..."
}

distro_version() {
    clear
    echo "Current distro being ran:"
    cat /etc/*release | grep PRETTY_NAME | cut -d "=" -f 2- | tr -d '"'
    read -p "Press [Enter] key to return to main menu..."
}

directory_changes() {
    clear
    echo "Displaying free memory:"
    free -h
    read -p "Press [Enter] key to return to main menu..."
}

installed_packages() {
    clear
    head -n 200 /var/log/apt/history.log 2>/dev/null | grep -oP 'Commandline: \K.*' ; head -n 200 /var/log/apt/yum.log 2>/dev/null | grep -oP 'Commandline: \K.*' ; head -n 200 /var/log/apt/dnf.log 2>/dev/null | grep -oP 'Commandline: \K.*' ; head -n 200 /var/log/apt/pacman.log 2>/dev/null | grep -oP 'Commandline: \K.*'
    read -p "Press [Enter] key to return to main menu..."
}

list_containers() {
    clear
    echo "Displaying currently logged in users:"
    who
    read -p "Press [Enter] key to return to main menu..."
}

network_capture() {
    clear
    echo "Displaying running processes:"
    ps aux
    read -p "Press [Enter] key to return to main menu..."
}

local_login() {
    clear
    echo "Displaying last system boot:"
    who -b
    read -p "Press [Enter] key to return to main menu..."
}

ssh_auths() {
    clear
    echo "Displaying kernel version:"
    uname -r
    read -p "Press [Enter] key to return to main menu..."
}

failed_ssh_auths() {
    clear
    echo "Displaying hostname:"
    hostname
    read -p "Press [Enter] key to return to main menu..."
}

bash_history() {
    clear
    tail -n 20 ~/.bash_history
    read -p "Press [Enter] key to return to main menu..."
}

# Main loop to display the menu until the user chooses to exit
while true; do
    clear
    show_ascii_art
    show_menu
    read_input
    echo ""
done
