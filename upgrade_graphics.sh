#!/bin/bash

# Download prebuild files
cd ~
mkdir -p tmp
cd tmp
wget https://github.com/zzxzzk115/GameShell-Scripts/releases/download/v0.1.0/prebuild.zip
unzip prebuild.zip

# Install libdrm
cd ~/tmp/prebuild/
sudo chmod +x ./libdrm/install.sh
./libdrm/install.sh

# Install mesa
cd ~/tmp/prebuild/
sudo chmod +x ./mesa/install.sh