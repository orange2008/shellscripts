#!/bin/sh

echo "Compiling from git.."
sudo apt update
sudo apt install gcc g++ make cmake build-essential git perl protobuf-compiler libprotobuf-dev libncurses5-dev zlib1g-dev libutempter-dev libssl-dev pkg-config -y
git clone https://github.com/mobile-shell/mosh
cd mosh
./autogen.sh
./configure
make
sudo make install

