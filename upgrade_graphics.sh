#!/bin/bash

# Install Ninja
sudo apt-get install ninja-build

# Build and install CMake 3.23.1
cd ~
wget -P . -m -nH https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1.tar.gz
tar -xzvf cmake-3.23.1.tar.gz
cd cmake-3.23.1
./bootstrap --prefix=/usr/ && make -j4 && sudo make install

# Reinstall meson
sudo apt-get remove meson
sudo pip3 install meson

# Build and install libdrm 2.4.110
cd ~
wget -P . -m -nH https://dri.freedesktop.org/libdrm/libdrm-2.4.110.tar.xz
xz -d  libdrm-2.4.110.tar.xz
tar -xf libdrm-2.4.110.tar
cd libdrm-2.4.110/
meson build --prefix=/usr/  
sudo ninja -C build/ install

# Install dependencies
cd ~
sudo apt-get install g++ python3-mako zlib1g-dev libexpat1-dev flex bison libx11-dev libxext-dev libxdamage-dev libxcb-glx0-dev libx11-xcb-dev libxcb-dri2-0-dev libxcb-dri3-dev libxcb-present-dev libxshmfence-dev libxxf86vm-dev libxrandr-dev libunwind-dev llvm

# Build and install Mesa 22.1
wget -P . -m -nH https://archive.mesa3d.org/mesa-22.1.0.tar.xz
xz -d mesa-22.1.0.tar.xz
tar -xf mesa-22.1.0.tar
cd mesa-22.1.0
meson build --prefix=/usr/   -Dbuildtype=release   -Dgallium-drivers=kmsro,lima,swrast -Dosmesa=false -Dplatforms=x11
sudo ninja -C build/ install