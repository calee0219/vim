#!/bin/bash

path=$(pwd)
# checking Linux OS
if which apt-get >/dev/null 2>&1; then
    app='sudo apt-get install'
elif which dnf >/dev/null 2>&1; then
    app='sudo dnf install'
elif which pacman >/dev/null 2>&1; then
    app='sudo pacman -S'
fi

git submodule init
git submodule update

vim +PluginInstall +qall
yes y | $app automake gcc gcc-c++ kernel-devel cmake
yes y | $app python-devel python3-devel
cd $path/bundle/YouCompleteMe
./install.py --all
ln -fs $path/ycm_extra_conf.py ~/.ycm_extra_conf.py
