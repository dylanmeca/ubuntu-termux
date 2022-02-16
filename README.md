# Ubuntu on Termux
[![Build Status](https://img.shields.io/github/stars/dylanmeca/ubuntu-android.svg)](https://github.com/dylanmeca/ubuntu-termux)
[![License](https://img.shields.io/github/license/dylanmeca/ubuntu-android.svg)](https://github.com/dylanmeca/ubuntu-termux/blob/main/LICENSE)
[![dylanmeca](https://img.shields.io/badge/author-dylanmeca-green.svg)](https://github.com/dylanmeca)
[![bug_report](https://img.shields.io/badge/bug-report-red.svg)](https://github.com/dylanmeca/ubuntu-termux/blob/main/.github/ISSUE_TEMPLATE/bug_report.md)
[![security_policy](https://img.shields.io/badge/security-policy-cyan.svg)](https://github.com/dylanmeca/ubuntu-termux/blob/main/SECURITY.md)
[![Bash](https://img.shields.io/badge/language-Bash-blue.svg)](https://www.gnu.org/software/bash/)

Install Ubuntu on Android using Termux, no need for root.

Develop software using the Ubuntu distribution on your android without the need for root and install software maintained by Canonical.

## Pre-requirements

The requirements to install Ubuntu on android is to have termux installed and within termux it is necessary to have proot installed. It is not necessary to have root.

## Installation

To install Ubuntu in Termux you need to run these commands:

```shell
pkg install wget -y
pkg install proot -y
wget https://raw.githubusercontent.com/dylanmeca/ubuntu-termux/main/install.sh
chmod +x install.sh
./install.sh
```

Once the installation is finished to start Ubuntu you have to execute the command: ```ubuntu```

It is also possible to run an Ubuntu command from Termux. For example: ```ubuntu pwd```.

This will allow to run ubuntu commands from termux.

## Solution to known issues

* 1- One of the main mistakes is:

```text
groups: cannot find name for group ID 3003
groups: cannot find name for group ID 9997
groups: cannot find name for group ID 50399
```

To solve this error you must run these commands.

```shell
addgroup --system --gid 3003 inet
addgroup --system --gid 9997 everybody
addgroup --system --gid 50399 all_a399
```

Once these commands have been executed, this error will have been solved.

## Authors

* **Dylan Meca** - *Initial Work* - [dylanmeca](https://github.com/dylanmeca)

You can also look at the list of all [contributors](https://github.com/dylanmeca/ubuntu-termux/contributors) who have participated in this project.

## License

The license for this project is [GPL-3.0](https://github.com/dylanmeca/ubuntu-termux/blob/main/LICENSE).
