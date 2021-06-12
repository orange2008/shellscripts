#!/bin/sh
echo "Downloading BestTrace from ipip.net..."
mkdir besttrace
cd besttrace
wget -O besttrace.zip "https://cdn.ipip.net/17mon/besttrace4linux.zip"
unzip besttrace.zip
chmod +x besttrace
echo "Installation completed."

