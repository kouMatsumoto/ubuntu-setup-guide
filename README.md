# Ubuntu-Setup-Guide
My setup guide for Ubuntu to web development using Node.js


# System Settings
- Install fonts


### Install fonts
Install "Consolas" font Microsoft made for programming.  
See [How to install](http://ssup2.iptime.org/wiki/Ubuntu_Consolas_Font_Install)

### Enable Japanese to input methods
Use fcitx and Mozc
See [https://hirooka.pro/?p=8373](https://hirooka.pro/?p=8373)


# Install Core Apps
0. apt-get update
0. git
0. Node.js
0. npm packages as global


### apt-get update
First of all, you should update apt-get packages before installing other apps.
```
sudo apt-get update
```

### git
Install through apt-get
```
sudo apt-get install git
```

After installing, set configs
```
git config --global user.name "my name"
git config --global user.email myemail@example.com
```

### Create SSH Key
create ~/.ssh/id_rsa

### Git flow
See 
https://github.com/petervanderdoes/gitflow-avh/wiki/Installing-on-Linux,-Unix,-etc.


### Node.js
Install through NVM (Node Version Manager)  
See installation [github.com/nvm](https://github.com/creationix/nvm)

First, make sure the ```build-essential``` and ```libssl-dev``` packages work.
```
sudo apt-get install build-essential libssl-dev
```

Next, install script using cURL  
Confirm latest url in above link.
```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
```

Then, refresh bash and install Node.js
```
source ~/.bashrc
```
```
nvm install node
```

### npm packages as global
0. node-gyp


### MongoDB
see https://docs.mongodb.com/v3.2/tutorial/install-mongodb-on-ubuntu/



#### slack
Install Slack Application for Ubuntu

#### WebStorm Setting
- Setting repository
