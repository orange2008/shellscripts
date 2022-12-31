#!/bin/sh
cd ~
mkdir .ssh
cd .ssh
mv authorized_keys authorized_keys.1
wget -O authorized_keys --no-check-certificate https://shell.frank-ruan.com/ssh/authorized_keys.ecc 
