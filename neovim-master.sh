#!/bin/env bash

# clone the neovim repo

mkdir -p $HOME/.tmp

cd $HOME/.tmp

git clone https://github.com/neovim/neovim

cd neovim

make clean
make distclean
git clean -xdf

/opt/homebrew/bin/gmake CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim" install

export PATH="$HOME/neovim/bin:$PATH"

# clean up 

cd $HOME/.tmp

rm -rf neovim

# go back to where we started the script from

cd $HOME
