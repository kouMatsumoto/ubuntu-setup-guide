# Ubuntu Setup Guide
### This is the setup guide for Ubuntu for web development.

---

`This note is presently in draft`

---

> Supported version: `Ubuntu 16.04.2 LTS`
>
> For Windows: [Windows Setup Guides](https://github.com/kouMatsumoto/windows10-setup-guide)  
> For MacOS: [MacOS Setup Guides](https://github.com/kouMatsumoto/macos-setup-guide)

---

## Table of contents
- [Install Ansible](#install-ansible)
- [System Settings](#system-settings)
  1. [TimeZone](#timezone)
  1. [Locale](#locale)
  1. [Firewall](#firewall)
- [Fonts](#fonts)
  1. [Consolas](#consolas)
  1. [NotoSans](#notosans)
- [Essential packages](#essential-packages)
  1. [Update packages](#update-packages)
  1. [vim](#vim)
  1. [xsel](#xsel)
  1. [cabextract](#cabextract)
  1. [font-manager](#font-manager)
  1. [fonts](#fonts)
  1. [Enable Japanese as the input method](#enable-japanese-as-the-input-method)
- [Software to web development](#software-to-web-development)
  1. [Git](#git)
  1. [Node.js](#nodejs)
  1. [PHP](#php)
  1. [Ruby](#ruby)
  1. [MySQL](#mysql)
  1. [MongoDB](#mongodb)
  1. [Redis](#redis)
- [IDE and Editors](#ide-and-editors)
  1. [WebStorm](#webstorm)
  1. [Visual Studio Code](#visual-studio-code)
- [Other utilities](#other-utilities)



# Install Ansible
> By using `Ansible`, we can execute automatically all set-up procedures below.

First of all, install `Ansible` and make sure you can use `ansible` command.

### How to install Ansible
Refer to the official installation [docs.ansible.com](http://docs.ansible.com/ansible/intro_installation.html#latest-releases-via-apt-ubuntu), or use my shell-script: [install-ansible.sh](https://github.com/kouMatsumoto/ubuntu-setup-guide/blob/master/install-ansible.sh).

After installation, make sure you can use `ansible` command.

```bash
$ ansible --version

# expected result
ansible 2.2.1.0
  config file = /etc/ansible/ansible.cfg
  configured module search path = Default w/o overrides
```




# System-Settings
### TimeZone
### Locale

### Firewall
We'll use services that open network ports such as nginx.
So we need to use firewall to keep our machine secure.

1. Enable `ufw`
```bash
$ sudo ufw enable
```

2. Allow access from entire sub-network such as 192.168.\*.\*
```bash
$ sudo ufw allow proto tcp from 192.168.0.0/16
```


# Fonts
### Consolas
`Consolas` is essential font for me to programming. I use it as default for IDEs and editors.  
Install manually by following my procedure, or automatically by using ansible.

> In addition to below, refer to this wiki [Ubuntu Consolas Font Install](http://ssup2.iptime.org/wiki/Ubuntu_Consolas_Font_Install)


1. Install prerequisite packages via apt.

- `font-manager` is GUI font management software.
- `cabextract` is software to extract Microsoft cabinet files also called `.cab`.

```
$ sudo apt-get install font-manager
$ sudo apt-get install cabextract
```

2. Create `consoles.sh` file to download font data and make it installable.

```
$ sudo vim consolas.sh

#!/bin/sh
set -e
set -x
mkdir temp
cd temp
wget http://download.microsoft.com/download/E/6/7/E675FFFC-2A6D-4AB0-B3EB-27C9F8C8F696/PowerPointViewer.exe
cabextract -L -F ppviewer.cab PowerPointViewer.exe
cabextract ppviewer.cab
```

```bash
$ sudo chmod +x consolas.sh
$ sudo ./consolas.sh
$ cd temp
$ font-manager
```

3. Install fonts by using font-manager GUI.



### NotoSans
1. Download zipped font file and extract it.

```bash
$ wget https://noto-website.storage.googleapis.com/pkgs/NotoSans-hinted.zip
$ unzip NotoSans-hinted.zip -d NotoSans-hinted
```

2. Move `.ttf` files to `/usr/share/fonts/truetype/` directory where is recognized by Ubuntu

```bash
$ sudo mkdir /usr/share/fonts/truetype/notosans
$ sudo mv NotoSans-hinted/* /usr/share/fonts/truetype/notosans
```

3 Update font setting
```bash
$ fc-cache -f
```

4 Confirm installed and remove unnecessary files
```bash
$ fc-list | grep -i 'notosans'
$ rm -rf NotoSans-hinted.zip NotoSans-hinted
```



# Essential packages
These are essential packages of `apt` for your Ubuntu.


### Update packages
First of all, update installed packages in apt-get.

```
$ sudo apt-get update
```

### gdevi

```
$ sudo apt-get install gdebi
```

### vim
Default vi may be old. Install newest vim with apt.

```
$ sudo apt install vim 
```

After install, change default editor for OS. (usually default is nano.)

```
$ sudo update-alternatives --config editor
```

### xsel
A utility command-line tool for clipboard copy and paste.  
This will be used to copy ssh-key to clipboard.

```
$ sudo apt-get install xsel
```

### cabextract
`cabextract` is software to extract Microsoft cabinet files also called `.cab`.  
It's need to install fonts of Microsoft such as `Consolas` which is essential font of my-programming.

```
$ sudo apt-get install cabextract
```

### font-manager
`font-manager` is useful GUI software to manage your fonts.

```bash
$ sudo apt install font-manager
```



### Enable Japanese as the input method
http://gihyo.jp/admin/serial/01/ubuntu-recipe/0417


Use fcitx and Mozc to input Japanese.
See [this post](https://hirooka.pro/?p=8373).

Install fcitx-mozc

```
$ sudo apt-get install fcitx-mozc
```

Change Language Support settings.

```
Open "System Settings" - "Language Support"
Change "Keyboard input method system" to "fcitx"
Logout Ubuntu
Login Ubuntu
Open "Application" - "Fcitx Configuration"
Select "input Method" tab
Add "mozc(Japanese)" (Disable "Only show Current Language" check)
Select "Global Config" - "Hotkey"
Set "Trigger Input Method" to [Super]+[Space]
Confirm you can use Japanese input method with [Super]+[Space] toggle
```


After enabled fcitx, change shortcut for "Fcitx Clipboard access".  
`fxitx Input Method Configuration > Addon > Clipboard`  
As default, this will conflict with WebStorm AceJump shortcut.


**[Back to top](#table-of-contents)**



# Software to web development
Install and set-up core software to web development.

### WebStorm
Primary IDE to develop web.
Download from [jetbrains.com](https://www.jetbrains.com/webstorm/) and Install.

#### Settings Repository
Set your repository and overwrite your local settings.

#### Install Plugins
Install useful plugins below.

- .ignore
- AceJump
- gfm
- Git Flow Integration
- Markdown Support
- BashSupport
- YAML/Ansible support

#### Change Ubuntu system shortcuts
See [this post](http://askubuntu.com/questions/412046/unable-to-use-intellij-idea-keyboard-shortcuts-on-ubuntu)

### Visual Studio Code
Secondary editor to edit brief code.
Download from [code.visualstudio.com](https://code.visualstudio.com/) and Install.


### Git
Install with apt-get

```
$ sudo apt-get install git
```

#### Set global configs
After installing, set global configs

```
$ git config --global user.name "my name"
$ git config --global user.email myemail@example.com
```

#### Create ssh-key and register to GitHub
create ssh keys in `~/.ssh`, after checking existence.

```
$ cd ~
$ ls -la .ssh
$ mkdir .ssh
$ cd .ssh
```

Next create ssh keys
```
$ ssh-keygen -t rsa
```

**Note:** The key name is recommended `id_rsa` (default).
This reason is that by default git uses `id_rsa` to connect server.
In this case, you don't need to change ssh-key settings of git config. 

Now, register key to github.com.

Copy id_rsa.pub to clipboard.

```
$ xsel --clipboard < id_rsa.pub
```

Register this on [https://github.com/settings/ssh](https://github.com/settings/ssh).

Test connection to github.

```
$ ssh -T git@github.com
```

#### Git flow
Install with apt-get.

```
$ sudo apt-get install git-flow
```

#### Git quick-state
See installation.

https://github.com/arzzen/git-quick-stats


### Node.js
Install through NVM (Node Version Manager)  
See installation [github.com/nvm](https://github.com/creationix/nvm)

First, make sure the ```build-essential``` and ```libssl-dev``` packages work.

```
$ sudo apt-get install build-essential libssl-dev
```

Next, install script using cURL  
Confirm latest url in above link.

```
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
```

Then, refresh bash and install Node.js

```
$ source ~/.bashrc
```
```
$ nvm install node
```

#### npm modules you should install as global
Below modules is often used and useful if installed in global.

1. node-gyp
1. gulp
1. typescript



### MongoDB
see https://docs.mongodb.com/v3.2/tutorial/install-mongodb-on-ubuntu/

```
$ sudo mkdir -p /data/db
$ sudo chown -R `id -u` /data/db
```


### Redis
see https://redis.io/download
see https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-redis-on-ubuntu-16-04


### MySQL

Rails and MySQL
see https://www.digitalocean.com/community/tutorials/how-to-use-mysql-with-your-ruby-on-rails-application-on-ubuntu-14-04



#Other utilities

### Ansible
See installation [http://docs.ansible.com/ansible/intro_installation.html](http://docs.ansible.com/ansible/intro_installation.html)

```
$ sudo apt-get install software-properties-common
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt-get update
$ sudo apt-get install ansible
```

### Vagrant and VirtualBox
Reference URLs

- http://askubuntu.com/questions/465454/problem-with-the-installation-of-virtualbox
- https://www.olindata.com/blog/2014/07/installing-vagrant-and-virtual-box-ubuntu-1404-lts

#### Disable UEFI Secure Boot through BIOS settings
To use VirtualBox, It need to be disabled UEFI Secure Boot. 
First of all, set UEFI Secure Boot disabled.

#### Install VirtualBox
After setting to disable UEFI Secure Boot, Install VirtualBox with `apt-get`.

```
$ sudo apt-get install virtualbox
```

Make sure you can use virtualbox with no errors.

```
$ virtualbox --help
```

#### Install Vagrant
After installing VirtualBox, Install vagrant too.

```
$ sudo apt-get install vagrant
```

Make sure you can use vagrant.

Uncomment this part of Vagrantfile

```
config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = "1024"
 end
```

##### Optional settings
To allow ansible to access, enable private_network

```
config.vm.network "private_network", ip: "192.168.33.10"
```


Change synced folder setting.

```
config.vm.synced_folder "../data", "/vagrant_data"
```

When error occurs.

```
vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
```



* Ubuntu16.04 on Vagrant *
https://atlas.hashicorp.com/boxcutter/boxes/ubuntu1604-desktop
https://github.com/chef/bento/issues/682



### slack
Install Slack Application for Ubuntu from [slack.com](https://slack.com/downloads/linux)

### Google Chrome
https://linuxconfig.org/how-to-install-google-chrome-browser-on-ubuntu-16-04-xenial-xerus-linux
