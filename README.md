# Ubuntu-Setup-Guide
My setup guide for Ubuntu to web development using Node.js  

`This note is now draft`





### Update packages
First of all, update packages of apt-get.

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
$sudo apt-get install xsel
```


### Install fonts
Install popular fonts below.

- Consolas: The font for programming Microsoft made.
- Meiryo: The font to check web design.

See [How to install](http://ssup2.iptime.org/wiki/Ubuntu_Consolas_Font_Install)

Install packages to install fonts.
```
$ sudo apt-get install font-manager
$ sudo apt-get install cabextract
```

Create consoles.sh to download and execute.
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
```


```
$ cd temp
$ font-manager
```

### Enable Japanese to input methods
Use fcitx and Mozc
See [https://hirooka.pro/?p=8373](https://hirooka.pro/?p=8373)

Install
```
$ sudo apt-get install fcitx-mozc
```

After enabled fcitx, change shortcut for "Fcitx Clipboard access".  
`fxitx Input Method Configuration > Addon > Clipboard`  
As default, this will conflict with WebStorm AceJump shortcut.





# Install Core Apps
0. git
0. Node.js
0. npm packages as global


### git
Install through apt-get
```
$sudo apt-get install git
```

After installing, set configs
```
$git config --global user.name "my name"
$git config --global user.email myemail@example.com
```

### Create SSH Key
create ssh keys to `~/.ssh`.

Make sure `~/.ssh` is exists or create.
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

Note that the key name is recommended `id_rsa` (default).  
The reason for git uses `id_rsa` in default settings.

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

### Git flow
See [installation](https://github.com/petervanderdoes/gitflow-avh/wiki/Installing-on-Linux,-Unix,-etc)



### Node.js
Install through NVM (Node Version Manager)  
See installation [github.com/nvm](https://github.com/creationix/nvm)

First, make sure the ```build-essential``` and ```libssl-dev``` packages work.
```
$sudo apt-get install build-essential libssl-dev
```

Next, install script using cURL  
Confirm latest url in above link.
```
$curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
```

Then, refresh bash and install Node.js
```
$source ~/.bashrc
```
```
$nvm install node
```

### npm packages as global
0. node-gyp


### MongoDB
see https://docs.mongodb.com/v3.2/tutorial/install-mongodb-on-ubuntu/
```
$sudo mkdir -p /data/db
$sudo chown -R `id -u` /data/db
```


#### slack
Install Slack Application for Ubuntu

#### WebStorm Setting
- Setting repository
