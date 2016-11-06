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
1. [Other utilities](#other-utilities)



#System Settings and Essential packages
Before installing software to web development, Get your Ubuntu ready.

### Update packages
First of all, update installed packages in apt-get.

```
$ sudo apt-get update
```


### Install vim
Default vi may be old. Install newest vim with apt.

```
$ sudo apt install vim 
```


### Install xsel
A utility command-line tool for clipboard copy and paste.  
This will be used to copy ssh-key to clipboard.

```
$ sudo apt-get install xsel
```


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

Download from [jetbrains.com](https://www.jetbrains.com/webstorm/).


### Visual Studio Code
Secondary editor to edit brief code.

Download from [code.visualstudio.com](https://code.visualstudio.com/)


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



#Other utilities

### slack
Install Slack Application for Ubuntu

### WebStorm Setting
- Setting repository
