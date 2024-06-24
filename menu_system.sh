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
    echo "1) Option 1: Show current uptime"
    echo "2) Option 2: Show Crontab (Scheduled tasks)"
    echo "3) Option 3: Current open and used ports via Netstat"
    echo "4) Option 4: Running kernel version"
    echo "5) Option 5: OS Version installed"
    echo "6) Option 6: Memory system information"
    echo "7) Option 7: Logged in users"
    echo "8) Option 8: x"
    echo "9) Option 9: x"
    echo "10) Option 10: Last 7 days of logins"
    echo "11) Option 11: Last 50 lines of command history"
    echo "12) Option 12: SSH Accepted password logins"
    echo "13) Option 13: SSH Rejected password login attempts"
    echo "14) Option 14: Exit"
}

# Function to handle user input and perform actions
read_input() {
    local choice
    read -p "Enter choice [1-14]: " choice
    case $choice in
        1)
            current_uptime
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
            display_uptime
            ;;
        6)
            display_free_memory
            ;;
        7)
            display_network_config
            ;;
        8)
            display_logged_in_users
            ;;
        9)
            display_running_processes
            ;;
        10)
            display_last_boot
            ;;
        11)
            display_kernel_version
            ;;
        12)
            display_hostname
            ;;
        13)
            display_current_directory
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
say_hello() {
    echo "Hello, World!"
    read -p "Press [Enter] key to return to main menu..."
}

show_date() {
    echo "Current date and time: $(date)"
    read -p "Press [Enter] key to return to main menu..."
}

list_files() {
    echo "Listing files in current directory:"
    ls
    read -p "Press [Enter] key to return to main menu..."
}

display_disk_usage() {
    echo "Displaying disk usage:"
    df -h
    read -p "Press [Enter] key to return to main menu..."
}

display_uptime() {
    echo "Displaying system uptime:"
    uptime
    read -p "Press [Enter] key to return to main menu..."
}

display_free_memory() {
    echo "Displaying free memory:"
    free -h
    read -p "Press [Enter] key to return to main menu..."
}

display_network_config() {
    echo "Displaying network configuration:"
    ifconfig
    read -p "Press [Enter] key to return to main menu..."
}

display_logged_in_users() {
    echo "Displaying currently logged in users:"
    who
    read -p "Press [Enter] key to return to main menu..."
}

display_running_processes() {
    echo "Displaying running processes:"
    ps aux
    read -p "Press [Enter] key to return to main menu..."
}

display_last_boot() {
    echo "Displaying last system boot:"
    who -b
    read -p "Press [Enter] key to return to main menu..."
}

display_kernel_version() {
    echo "Displaying kernel version:"
    uname -r
    read -p "Press [Enter] key to return to main menu..."
}

display_hostname() {
    echo "Displaying hostname:"
    hostname
    read -p "Press [Enter] key to return to main menu..."
}

display_current_directory() {
    echo "Displaying current directory:"
    pwd
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
