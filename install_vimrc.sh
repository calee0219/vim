#!/bin/bash

path=$(pwd)
# checking Linux OS
if which apt-get >/dev/null 2>&1; then
    app='sudo apt-get install -f'
    yes | $app build-essential cmake
    yes | $app python-dev python3-dev
    yes | $app powerline
    yes | $app ctags
    yes | $app vim-gnome-python2
elif which dnf >/dev/null 2>&1; then
    app='sudo dnf install --best --allowerasing'
    yes | $app automake gcc gcc-c++ kernel-devel cmake
    yes | $app python-devel python3-devel
    yes | $app powerline
    yes | $app ctags
fi

echo 'if [ -d "$HOME/.local/bin"  ]; then
    PATH="$HOME/.local/bin:$PATH"
fi' >> ~/.profile

git submodule init
git submodule update

vim +PluginInstall +qall
cd $path/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --all
ln -fs $path/ycm_extra_conf.py ~/.ycm_extra_conf.py

# install airline font
cd $path/fonts
./install.sh
ln -fs $path/fonts ~/.fonts/powerline-fonts
