#!/bin/bash

# Download prebuild files
cd ~
mkdir -p tmp
cd tmp
wget https://github.com/zzxzzk115/GameShell-Scripts/releases/download/v0.1.1/prebuild.zip
unzip prebuild.zip

# Install libdrm
cd ~/tmp/prebuild/libdrm
sudo chmod +x install.sh
./install.sh

# Install mesa
cd ~/tmp/prebuild/mesa
sudo chmod +x install.sh
./install.sh