#!/bin/bash

cd ~/.vim

git submodule init
git submodule update

ln -fs ~/.vim ~/.vim
vim +PluginInstall +qall
yes y | sudo $app install automake gcc gcc-c++ kernel-devel cmake
yes y | sudo $app install python-devel python3-devel
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --gocode-completer --tern-completer
ln -fs ~/.vim/ycm_extra_conf.py ~/.ycm_extra_conf.py
