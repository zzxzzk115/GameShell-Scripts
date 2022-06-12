#!/bin/bash

# Download prebuild files
cd ~
mkdir -p tmp
cd tmp
wget https://raw.githubusercontent.com/zzxzzk115/GameShell-Scripts/main/data/prebuild.zip
unzip prebuild.zip

# Install libdrm
cd ~/tmp/prebuild/libdrm
sudo chmod +x install.sh
./install.sh

# Install mesa
cd ~/tmp/prebuild/mesa
sudo chmod +x install.sh
./install.sh