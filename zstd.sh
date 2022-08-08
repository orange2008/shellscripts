#!/bin/sh
echo "Compiling zstd..."
sudo apt update
sudo apt install -y gcc g++ build-essential cmake git curl wget zlibg1 zlibg1-dev liblz4-dev liblzma-dev
git clone https://github.com/facebook/zstd.git --depth=1
cd zstd
make -j$(nproc)
sudo make install
