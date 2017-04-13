#!/bin/sh

# This is a shell script to enable to use ansible

sudo apt-get install software-propereties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y
