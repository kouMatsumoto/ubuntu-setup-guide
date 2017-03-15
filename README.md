# Ubuntu-Setup-Guide
### The setup guides for Ubuntu OS to develop Node.js web system.

---

`This note is now draft`

---

> If you are Windows user, see [Windows Setup Guides](https://github.com/kouMatsumoto/windows10-setup-guide)  
> If you are MacOS user, see [MacOS Setup Guides](https://github.com/kouMatsumoto/macos-setup-guide)

---

## Table of contents

1. [System Settings and Essential packages](#system-settings-and-essential-packages)
  1. [Update packages](#update-packages)
  1. [Install vim](#install-vim)
  1. [Install xsel](#install-xsel)
  1. [Install fonts](#install-fonts)
  1. [Enable Japanese as the input method](#enable-japanese-as-the-input-method)
1. [Software to web development](#software-to-web-development)
  1. [WebStorm](#webstorm)
  1. [Visual Studio Code](#visual-studio-code)
  1. [Git](#git)
  1. [Node.js](#nodejs)
  1. [MongoDB](#mongodb)
  1. [Redis](#redis)
1. [Other utilities](#other-utilities)



#System Settings and Essential packages
Before installing software to web development, Get your Ubuntu ready.

### Update packages
First of all, update installed packages in apt-get.

```
$ sudo apt-get update
```

### gdevi

```
$ sudo apt-get install gdebi
```


### Install vim
Default vi may be old. Install newest vim with apt.

```
$ sudo apt install vim 
```

After install, change default editor for OS. (usually default is nano.)

```
$ sudo update-alternatives --config editor
```


### Install xsel
A utility command-line tool for clipboard copy and paste.  
This will be used to copy ssh-key to clipboard.

```
$ sudo apt-get install xsel
```

### cabextract



### Install fonts
Install popular fonts below.

- Consolas: The font for programming Microsoft made.
- Meiryo: The font to check web design.

#### Consolas and Meiryo
See [How to install](http://ssup2.iptime.org/wiki/Ubuntu_Consolas_Font_Install)

Install packages to install fonts.

```
$ sudo apt-get install font-manager
$ sudo apt-get install cabextract
```

Create consoles.sh to download font data and make installable.

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

```
$ sudo chmod +x consolas.sh
$ sudo ./consolas.sh
$ cd temp
$ font-manager
```

Install fonts with font-manager GUI.


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
To access with ansible, enable private_network

```
config.vm.network "private_network", ip: "192.168.33.10"
```


Change synced falder setting.

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
