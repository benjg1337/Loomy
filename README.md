```
 ______                                 
___  / ___________________ ________  __
__  /  _  __ \  __ \_  __ `__ \_  / / /
_  /___/ /_/ / /_/ /  / / / / /  /_/ / 
/_____/\____/\____//_/ /_/ /_/_\__, /  
                              /____/   
```
Unix & GNU/Linux IR tool that illuminates the way for weary cyber security analysts. 

# Loomy - Cyber Security Incident Response Tool (Unix & GNU/Linux)

Loomy is a command-line tool designed for cyber security incident response tasks. It provides various utilities to gather system information and monitor activities.

## Install Guide
Run the following command for easy install ideally within /Opt, or manually download and run.

``` git clone https://github.com/benjg1337/Loomy.git && cd Loomy && chmod +x build.sh && ./build.sh```

### Requirements
This tool will enumerate through directories within linux file structures using bash. It should work on most modern GNU/Linux ditros & MacOS (as long as the GNU / Unix core-utils are present). The build file is created for Bash and ZSH, if anything else is used, please manually source the script into your configuration file. 

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
| Option 9      | Create formatted network connection capture (60 seconds) |
| Option 10     | Print out of last 7 days of local logins |
| Option 11     | Reads through journalctl, pulls SSH logins |
| Option 12     | Reads through journalctl, pulls failed SSH login attempts |
| Option 13     | Pulls the last 50 lines of history from ~/.bash_history |
| Option 14     | Escape clause |

## Use Cases

Loomy is the ideal tool for scraping through the complexities of a Unix file system with ease. Ideal for post security alert IR, generic troubleshooting or for learning purposes. 

## License 

As can be seen in the License.md file above, Loomy operates under the [MIT](https://opensource.org/license/mit) open source license. 
