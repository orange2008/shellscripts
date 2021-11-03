#!/bin/sh
sudo apt update
sudo apt install ssh openssh-server -y
cd ~
mkdir .ssh
cd .ssh
wget --no-check-certificate https://shell.frank-ruan.com/ssh/authorized_keys 
sudo systemctl restart sshd
sudo systemctl enable sshd
