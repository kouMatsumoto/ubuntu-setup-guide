## install Ubuntu
install from installer.

## apt update
```bash
$ sudo apt update
$ sudo apt upgrade
```

## install google chrome
install from web.

## install git with apt
```bash
$ sudo apt install git -y
```

## install webstorm

## install ansible
```bash
$ sudo apt install software-properties-common
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt update
$ sudo apt install ansible -y
```

## clone this repository to execute ansible-pleybook
```bash
$ git clone https://github.com/kouMatsumoto/ubuntu-setup-guide.git
$ cd ubuntu-setup-guide/ansible
$ cp vars/sample.yml vars/localhost.yml
$ gedit vars/localhost.yml

# edit `ansible_sudo_pass` and `user_name`

# ansible-playbook setup-localhost.yml -bK
```

## create ssh-key
```bash
$ cd
$ mkdir .ssh
$ cd .ssh/
$ ssh-keygen
```

## create gpg key
restore from master data

```bash
$ gpg2 --import your-master-data.asc
```

## install slack
## install keybase
install from web.

## install nvm
## install node.js
