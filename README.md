# Gavin Lee's vimrc settlement

This is [Gavin Lee's](https://github.com/calee0219) vimrc settlement.

Basically, I just used [amix's vimrc](https://github.com/amix/vimrc).

I have also copy the rc script from [vgod's vimrc](https://github.com/vgod/vimrc).

I also add some [appending tool](vimrcs/append) copy from [ma6174](https://github.com/ma6174/vim) to improve it

## How to install
#### Auto Install
* Use curl (for Mac OS X):
```shell
    curl -o - https://github.com/calee0219/vimrc/master/auto_install.sh | sh
```
* or wget (for most UNIX platforms):
```shell
    wget -O - https://github.com/calee0219/vimrc/master/auto_install.sh | sh
```

#### Manually Install
* First, type the command below in your termainal or cmd
```shell
git clone https://github.com/calee0219/vimrc.git ~/.vim
cd ~/.vim
```

* Then, type:
```shell
chmod 755 ~/.vim/install_vimrc.sh
sudo ~/.vim/install_vimrc.sh
```
That's it!

## Add your own rc script

If you want to add your own rc script, I recommend to add it in [~/.vim/vimrcs/my.vimrc](vimrcs/my.vimrc)

Of couse, you can also add it in [~/.vim/my_configs.vim](my_configs.vim) or just add it in ~/.vimrc

## Auto title

If you want to create files with title automatically set on it,

   such as: in C++ file, adding #indlude\<iostream\>...

you can add tax into [vimrcs/append/tital](vimrcs/append/tital)
