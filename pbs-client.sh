#!/bin/sh
mkdir /etc/apt/sources.list.d
wget -O /etc/apt/sources.list.d/pbs-client.list https://shell.frank-ruan.com/apt_sources/pbs-client.list
cd /tmp
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb -O libssl1.deb
apt install -y ./libssl1.deb
wget http://enterprise.proxmox.com/debian/proxmox-release-bullseye.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bullseye.gpg
apt update
apt install -y proxmox-backup-client
echo "\nDone."
