```
 ______                                 
___  / ___________________ ________  __
__  /  _  __ \  __ \_  __ `__ \_  / / /
_  /___/ /_/ / /_/ /  / / / / /  /_/ / 
/_____/\____/\____//_/ /_/ /_/_\__, /  
                              /____/   
```
Linux IR tool that illuminates the way for weary cyber security analysts. 

# Loomy - Cyber Security Incident Response Tool (Unix & GNU/Linux)

Loomy is a command-line tool designed for cyber security incident response tasks. It provides various utilities to gather system information and monitor activities.

## Install Guide
Run the following command for easy install ideally within /Opt, or manually download and run.

``` git clone https://github.com/benjg1337/Loomy.git && cd Loomy && chmod +x build.sh && ./build.sh```

## Menu Options
| Option        | Return        |
| ------------- | ------------- |
| Option 1      | Current uptime of the machine running |
| Option 2      | Crontab (shows current scheduled tasks for user) |
| Option 3      | Utilize netstat to show outbound open UDP & TCP ports |
| Option 4      | Displays the current running kernel version |
| Option 5      | Displays current Distro version / OS version |
| Option 6      | List altered files within the /Home /Opt directories in the last 7 days|
| Option 7      | List recently installed packages |
| Option 8      | List currenctly running Docker or Podman containers |
| Option 9      | Creat formatted network connection capture (60 seconds) |
| Option 10     | Print out of last 7 days of local logins |
| Option 11     | Reads through journalctl, pulls SSH logins |
| Option 12     | Reads through journalctl, pulls failed SSH login attempts |
| Option 13     | Pulls the last 50 lines of history from ~/.bash_history |
| Option 14     | Escape clause |

## Usecases
