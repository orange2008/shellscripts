#!/bin/sh
echo "You should install docker first."
echo "Port:"
read PORT
echo "Folder:"
read DIR
echo "ALL GOOD!"
docker pull ilemonrain/h5ai
docker run -d -p $PORT:80 -v $DIR:/h5ai --restart=always --name h5ai ilemonrain/h5ai:full
echo "VISIT http://{SERVER_IP}:$PORT"
echo "RECOMMEND TO INSTALL IPSEC VPN!"
echo "Using 'curl https://shell.frank-ruan.com/ipsec.sh > ipsec.sh && sudo bash ipsec.sh"
