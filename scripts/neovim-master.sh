#!/usr/bin/env bash

curr_dir="$(pwd)"

function abort() {
  echo "ERROR: $1" >&2
  exit 1
}

if ! command -v make >/dev/null 2>&1; then
    abort "no make"
fi

if ! command -v git >/dev/null 2>&1; then
    abort "no git"
fi

if [-n $CC ]; then
    abort "no cc not set"
fi

# clone the neovim repo
mkdir -p "${HOME}/.tmp"
cd "${HOME}/.tmp" || abort "no tmp"

git clone https://github.com/neovim/neovim

cd neovim || abort "no nvim"

make clean
make distclean
git clean -xdf

make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=${HOME}/neovim" install

# clean up 

cd "${HOME}/.tmp"
rm -rf neovim

# go back to where we started the script from

cd "${curr_dir}" || "abort no curr dir"
