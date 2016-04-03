#!/bin/bash

if which apt-get > /dev/null; then
    sudo apt-get install -y vim gcc ctags git python python-pip
elif which dnf > /dev/null; then
    sudo dnf install -y vim gcc ctags git python python-pip
elif which pacman > /dev/null; then
    sudo pacman -S vim gcc ctags git python python-pip
fi

mv -f ~/.vim ~/vim_old
mv -f ~/.vimrc ~/old.vimrc
echo "please wait for installing..."
cd ~/ && git clone https://github.com/calee0219/vim.git ~/.vim
cd ~/.vim

./install_vimrc.sh

echo "Installed the Ultimate Vim configration successfully!
Enjoy it! :-)"
