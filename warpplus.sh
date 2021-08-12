#!/bin/sh
echo "Installing WARP..."
mkdir wgcf
cd wgcf
wget -O wgcf https://github.com/ViRb3/wgcf/releases/download/v2.2.5/wgcf_2.2.5_linux_amd64
chmod +x wgcf
echo "PLEASE ACCEPT THE TOS MANUALLY!"
./wgcf register
./wgcf generate
echo "------------------------------"
# cat wgcf-account.toml
sudo apt install python3
curl https://shell.frank-ruan.com/wgcfid.py | python3
echo "------------------------------"
echo "Please write down the 'device_id', you'll need to use it later"
git clone https://github.com/aliilapro/warp-plus-cloudflare.git --depth=1
cd warp-plus-cloudflare
echo "Type in your device id and press Enter please."
python3 wp-plus.py
