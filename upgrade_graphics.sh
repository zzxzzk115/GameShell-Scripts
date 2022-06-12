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

# Post Fix
sudo mv /usr/lib/dri/sun4i_drm_dri.so /usr/lib/dri/sun4i_drm_dri.so.old
sudo mv /usr/lib/dri/sun4i-drm_dri.so /usr/lib/dri/sun4i_drm_dri.so
sudo mv /usr/lib/lima /usr/lib/lima.old/