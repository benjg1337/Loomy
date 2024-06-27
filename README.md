```
 ______                                 
___  / ___________________ ________  __
__  /  _  __ \  __ \_  __ `__ \_  / / /   ------------------------
_  /___/ /_/ / /_/ /  / / / / /  /_/ /   ------------
/_____/\____/\____//_/ /_/ /_/_\__, /   -------------------
                              /____/   --------------------------------
```
Unix & GNU/Linux IR tool that illuminates the way for weary cyber security analysts. 

# Loomy - Cyber Security Incident Response Tool (Unix & GNU/Linux)

Loomy is a command-line tool designed for cyber security incident response tasks. It provides various utilities to gather system information and monitor activities.

## Install Guide
Run the following command for easy install ideally within /Opt, or manually download and run.

``` sudo sh -c 'git clone https://github.com/benjg1337/Loomy.git && cd Loomy && chmod +x build.sh && ./build.sh'```

### Requirements
This tool will enumerate through directories within linux file structures using bash. It should work on most modern GNU/Linux ditros & MacOS, (as long as the GNU / Unix core-utils are present, as this will likely not work with Busybox depending upon symlinks and aliases). The build file is created for Bash and ZSH, if anything else is used, please manually source the script into your configuration file. 

## Menu Options
| Loomyscript              | Return       |
| -------------------------| ------------- |
| -h, --help                | Shows the help page |
| -v, --version             | Provides the current running version |
| -ut, --up-time           | Current uptime of the machine running |
| -ct, --cron-tab          | Crontab (shows current scheduled tasks for user) |
| -pi, --port-info         | Utilize netstat to show outbound open UDP & TCP ports |
| -kv, --kernel-version    | Displays the current running kernel version |
| -dv, --distro-version    | Displays current Distro version / OS version |
| -af, --altered-files     | List altered files within the /Home /Opt directories in the last 7 days|
| -i, --installed-packages | List recently installed packages |
| -lv, --list-virtuals     | List currenctly running Docker or Podman containers |
| -nc, --network-cap       | Create formatted network connection capture (60 seconds) |
| -ll, --local-logins      | Print out of last 7 days of local logins |
| -al, --accepted-logins   | Reads through journalctl, pulls SSH logins |
| -fl, --failed-logins     | Reads through journalctl, pulls failed SSH login attempts |
| -h, --history            | Pulls the last 50 lines of history from ~/.bash_history |

## Use Cases

Loomy is the ideal tool for scraping through the complexities of a Unix file system with ease. Ideal for post security alert IR, generic troubleshooting or for learning purposes. 

This tool aims to streamline the way we interact with the core utilites within the Unix file strucutre, as well as logging functions such as journalctl, dot files, authentication logs and permissions to create a cohesive idea of what is occuring on a Unix derived based endpoint or server.

In essence this aims to be a swiss army knife of useful scripts to really drill down into what is happening within the operating system, for those less confident within the command line. 

## License 

As can be seen in the License.md file above, Loomy operates under the [MIT](https://opensource.org/license/mit) open source license. 
