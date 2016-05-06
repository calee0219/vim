" ~/.dotfiles/vim/vimrcs/vundle.vimrc
" This is my vimrc
"
"
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add vulndle plugin here!!!
" plugin on GitHub repo

" Useful
Plugin 'tpope/vim-sensible'                 " This is for some sensible layout
Plugin 'Valloric/YouCompleteMe'             " This is for auto complete
Plugin 'ervandew/supertab'                  " This is for using for all your insert completion needs
Plugin 'scrooloose/nerdtree'                " This is for NERDtree
Plugin 'jiangmiao/auto-pairs'               " This is for auto complete brackets
Plugin 'majutsushi/tagbar'                  " This is for an easy way to browse the tags
Plugin 'scrooloose/nerdcommenter'           " This is for section comment
Plugin 'SirVer/ultisnips'                  " This is for ultimate solution for snippets
Plugin 'honza/vim-snippets'                " Snippets are separated from the engine. Add this if you want them:

" Appearance
Plugin 'vim-airline/vim-airline'            " This is for awesome outlook
Plugin 'vim-airline/vim-airline-themes'     " This is for awesome outlook
Plugin 'luochen1990/rainbow'                " This is for better bracket looks

" Build, Compile, Run
Plugin 'xuhdev/SingleCompile'               " For compile and run in vim
" C++ language
Plugin 'scrooloose/syntastic'               " This is for syntax checking
Plugin 'octol/vim-cpp-enhanced-highlight'   " This is for better c++ style syntax highlight

" Go language
Plugin 'fatih/vim-go'                       " For go auto complete
Plugin 'Blackrush/vim-gocode'               " For go auto complete

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Example
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
