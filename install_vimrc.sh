#!/bin/bash

path=$(pwd)
# checking Linux OS
if which apt-get >/dev/null 2>&1; then
    app='apt-get'
elif which dnf >/dev/null 2>&1; then
    app='dnf'
elif which pacman >/dev/null 2>&1; then
    app='pacman'
fi

git submodule init
git submodule update

vim +PluginInstall +qall
yes y | sudo $app install automake gcc gcc-c++ kernel-devel cmake
yes y | sudo $app install python-devel python3-devel
cd $path/bundle/YouCompleteMe
./install.py --clang-completer --gocode-completer --tern-completer
ln -fs $path/ycm_extra_conf.py ~/.ycm_extra_conf.py
