# Ubuntu 20.04 on Android
Install Ubuntu 20.04 on Android using Termux, no need for root.

Develop software using the Ubuntu 20.04 distribution on your android without the need for root and install software maintained by Canonical.

## Pre-requirements

The requirements to install Ubuntu 20.04 on android is to have termux installed and within termux it is necessary to have proot installed. It is not necessary to have root.

## Installation

To install Ubuntu in Termux you need to run these commands:

```shell
pkg install wget -y
pkg install proot -y
wget https://raw.githubusercontent.com/dylanmeca/ubuntu-android/main/install.sh
chmod +x install.sh
./install.sh
```

Once the installation is finished to start Ubuntu you have to execute the command: ```ubuntu```

It is also possible to run an Ubuntu command from Termux. For example: ```ubuntu pwd```.

This will allow to run ubuntu commands from termux.



