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

yes | $app automake gcc gcc-c++ kernel-devel cmake
yes | $app python-devel python3-devel
yes | $app powerline
echo 'if [ -d "$HOME/.local/bin"  ]; then
    PATH="$HOME/.local/bin:$PATH"
fi' >> ~/.profile

git submodule init
git submodule update

vim +PluginInstall +qall
cd $path/bundle/YouCompleteMe
./install.py --all
ln -fs $path/ycm_extra_conf.py ~/.ycm_extra_conf.py
