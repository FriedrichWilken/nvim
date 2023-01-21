#!/usr/bin/env bash
# get neovim running

## build neovim
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
git clone https://github.com/neovim/neovim ~/src/github.com/neovim/neovim
cd ~/src/github.com/neovim/neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install 

## install ripgrep
sudo apt-get install ripgrep
