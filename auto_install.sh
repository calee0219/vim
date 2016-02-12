#!/bin/bash

if which apt-get > /dev/null; then
    sudo apt-get install -y vim gcc ctags xclip astyle python-setuptools python-dev git python python-pip
elif which yum > /dev/null; then
    sudo yum install -y vim gcc ctags xclip astyle python-setuptools python-dev git python python-pip
fi
sudo pip install zipfile
sudo pip install shutil
sudo pip install tempfile
sudo pip install requests

sudo easy_install -?U autopep8

mv -f ~/.vim ~/vim_old
mv -f ~/.vimrc ~/old.vimrc
echo "please wait for installing..."
cd ~/ && git clone https://github.com/calee0219/vimrc.git ~/.vim
cd ~/.vim

python update_plugins.py

echo 'set runtimepath+=~/.vim

source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/filetypes.vim
source ~/.vim/vimrcs/plugins_config.vim
source ~/.vim/vimrcs/extended.vim

try
source ~/.vim/my_configs.vim
catch
endtry' > ~/.vimrc

echo "Installed the Ultimate Vim configration successfully!
Enjoy it! :-)"
