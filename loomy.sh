#!/bin/bash

# Function to display the splash screen
show_splash() {
    echo " ______  "
    echo " ___  / ___________________ ________  __"
    echo " __  /  _  __ \  __ \_  __ \`__ \_  / / /  ------------------------"
    echo " _  /___/ /_/ / /_/ /  / / / / /  /_/ /   ------------ "
    echo " /_____/\____/\____//_/ /_/ /_/_\__, /   -------------------"
    echo "                               /____/   -------------------------------- "
    ;;
    echo "Run with -h or --help to see usage information."
    echo
    exit 0
}

# Function to display the help message
show_help() {
    echo "Usage: $(basename "$0") [OPTION]..."
    echo "Loomy - A Unix & GNU/Linux IR tool that illuminates the way for weary cyber security analysts."
    echo
    echo "Options:"
    echo "  -h, --help        Show this help message and exit"
    echo "  -v, --version     Show the version information"
    echo "  -ut, --up-time   Current uptime of the machine running"
    echo "  -ct, --cron-tab    Crontab (shows current scheduled tasks for user)"
    echo "  -pi, --port-info    Utilize netstat to show outbound open UDP & TCP ports"
    echo "  -kv, --kernel-version    Displays the current running kernel version"
    echo "  -dv, --distro-version    Displays current Distro version / OS version"
    echo "  -af, --altered-files    List altered files within the /Home /Opt directories in the last 7 days"
    echo "  -o7, --option7    List recently installed packages"
    echo "  -o8, --option8    List currenctly running Docker or Podman containers"
    echo "  -o9, --option9    Create formatted network connection capture (60 seconds)"
    echo "  -o10, --option10  Print out of last 7 days of local logins"
    echo "  -al, --accepted-logins  Reads through journalctl, pulls SSH logins"
    echo "  -fl, --failed-logins  Reads through journalctl, pulls failed SSH login attempts"
    echo "  -h, --history  Pulls the last 50 lines of history from ~/.bash_history"
    echo
    exit 0
}

# Function to display the version information
show_version() {
    echo "$(basename "$0") version 1.2.1"
    exit 0
}

# Placeholder functions for each option
option1() { uptime ; exit 0; }
option2() { crontab -l 2>&1; exit 0; }
option3() { netstat -tulpn; exit 0; }
option4() { uname -r; exit 0; }
option5() { cat /etc/*release | grep PRETTY_NAME | cut -d "=" -f 2- | tr -d '"'; exit 0; }
option6() { find /home /opt -type f -mtime -7 -exec ls -l {} +; exit 0; }
option7() { head -n 200 /var/log/apt/history.log 2>/dev/null | grep -oP 'Commandline: \K.*' ; head -n 200 /var/log/apt/yum.log 2>/dev/null | grep -oP 'Commandline: \K.*' ; head -n 200 /var/log/apt/dnf.log 2>/dev/null | grep -oP 'Commandline: \K.*' ; head -n 200 /var/log/apt/pacman.log 2>/dev/null | grep -oP 'Commandline: \K.*'; exit 0; }
option8() {(command -v docker &>/dev/null && docker ps) || (command -v podman &>/dev/null && podman ps); exit 0; }
option9() { echo "Performing option 9"; exit 0; }
option10() { echo "Performing option 10"; exit 0; }
option11() { journalctl -u ssh | grep 'sshd.*Accepted password' | tail -n 20; exit 0; }
option12() { journalctl -u ssh | grep 'sshd.*Failed password' | tail -n 20; exit 0; }
option13() { tail -n 50 ~/.bash_history; exit 0; }

# Parse command-line arguments
if [[ "$#" -eq 0 ]]; then
    show_splash
fi

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -h|--help)
            show_help
            ;;
        -v|--version)
            show_version
            ;;
        -o1|--option1)
            option1
            ;;
        -o2|--option2)
            option2
            ;;
        -o3|--option3)
            option3
            ;;
        -o4|--option4)
            option4
            ;;
        -o5|--option5)
            option5
            ;;
        -o6|--option6)
            option6
            ;;
        -o7|--option7)
            option7
            ;;
        -o8|--option8)
            option8
            ;;
        -o9|--option9)
            option9
            ;;
        -o10|--option10)
            option10
            ;;
        -o11|--option11)
            option11
            ;;
        -o12|--option12)
            option12
            ;;
        -o13|--option13)
            option13
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            ;;
    esac
    shift
done
