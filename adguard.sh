#!/bin/sh
apt update
apt install -y wget curl 
echo "-------"
echo "You'll need to type in some arguments in order to finish your setup."
echo "Note that we won't make any changes on your Web UI."
echo "You need to go to http://$(curl -4 http://icanhazip.com):3000 to finish your AdGuard Setup."
echo "-- Script written by Frank Ruan. Licensed under MIT."
# Prompt user to enter their domain
echo "--------------------------"
echo "Your domain. (e.g. dns.contoso.com)"
read DOMAIN_NAME
echo "--------------------------"
echo "Assuming that you are using Cloudflare to manage your domain's DNS."
echo "Please go to https://dash.cloudflare.com/profile/api-tokens and view the 'Global API Key'."
echo "Paste it to here and click Enter please."
read CF_Key
echo "Your Email USED TO LOGIN to Cloudflare (e.g. admin@contoso.com)"
read CF_Email
echo "Okay, we are doing our job."
echo "Enabled Verbose logging..."
echo "Shutting down firewall..."
systemctl stop ufw
systemctl disable ufw
iptables -F
echo "Installing AdGuard Home..."
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v
echo "Installing acme.sh..."
curl https://get.acme.sh | sh -s email=$CF_Email
source ~/.bashrc
echo "Getting a TLS certificate for you..."
acme.sh --issue -d $DOMAIN_NAME --dns dns_cf
echo "The TLS certificate should be applied already."
echo "Freeing up your :53 port..."
mkdir /etc/systemd/resolved.conf.d
cd /etc/systemd/resolved.conf.d && wget --no-check-certificate https://shell.frank-ruan.com/adguardhome/adguardhome.conf
mv /etc/resolv.conf /etc/resolv.conf.backup
ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
systemctl reload-or-restart systemd-resolved
echo "Outputting the current port 53 usage, nothing should be outputted."
netstat -nlp | grep 53
echo "--------------------------------------------"
echo "Everything should be done."
CURRENT_IP = $(curl -4 http://icanhazip.com)
echo "Open http://$CURRENT_IP:3000 to do further configuration."
echo "Here's your certificate path (hopefully)."
echo "Certificate Path: /root/.acme.sh/$DOMAIN_NAME/fullchain.cer"
echo "Private Key Path: /root/.acme.sh/$DOMAIN_NAME/$DOMAIN_NAME.key"
echo "-------"
echo "Bugs report: admin@frank-ruan.com"
