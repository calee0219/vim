#!/bin/bash

path=$(pwd)

git submodule init
git submodule update

vim +PluginInstall +qall
yes y | sudo $app install automake gcc gcc-c++ kernel-devel cmake
yes y | sudo $app install python-devel python3-devel
cd ~/$path/bundle/YouCompleteMe
./install.py --clang-completer --gocode-completer --tern-completer
ln -fs ~/$path/ycm_extra_conf.py ~/.ycm_extra_conf.py
