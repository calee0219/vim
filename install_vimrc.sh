#!/bin/bash

cd ~/.vim

# update  plugins
pip install zipfile
pip install shutil
pip install tempfile
pip install requests
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
