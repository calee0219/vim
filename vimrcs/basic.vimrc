"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
language en_US.UTF-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
"" How long does tab truely is
set tabstop=4
"" How long will backspace delet a space
set softtabstop=4
"" How long when press tab
set shiftwidth=4
"" tab to space
set expandtab
"" Set auto tab
set autoindent
set cindent
set smartindent

"" Fold
"set foldenable
"set foldmethod=syntax
"set foldmethod=indent
"set foldcolumn=1
"set foldlevel=1
"" disable auto comment
setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"" Map leader to ,
let mapleader=' '

"" Enable hidden buffers
set hidden

"" Enable mouse used
set mouse=nvi

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
set bomb
set binary
set ttyfast

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
