set nocompatible               " be iMproved
filetype off                   " required!
" se t_Co=256
" =========================================================
" Vim plugins vundle definitions and settings
" =========================================================

" Enable vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Snippets
" garbas/vim-snipmate dependencies:
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
" Vim-snipmate itself
Bundle "garbas/vim-snipmate"
" Snippets pack
Bundle 'honza/snipmate-snippets'
let g:snipMate = {}
let g:snipMate.scope_aliases = {} 
let g:snipMate.scope_aliases['python'] = 'django,python'
let g:snipMate.scope_aliases['html'] = 'html,htmldjango,css,javascript'

" Git support
Bundle 'tpope/vim-fugitive'

" Python specific
Bundle 'gg/python.vim'
Bundle 'vim-scripts/python.vim--Vasiliev'
Bundle 'nvie/vim-flake8'
" Run flake8 on save
autocmd BufWritePost *.py call Flake8()

Bundle 'klen/rope-vim'
" Jump to the definition of whatever the cursor is on                                                                                 
map <leader>j :RopeGotoDefinition<CR>
" Rename whatever the cursor is on (including references to it)
map <leader>r :RopeRename<CR>

" File exploration
Bundle 'wincent/Command-T'

" Other
Bundle 'mattn/zencoding-vim'
"let g:user_zen_leader_key = '<C-k>'

Bundle 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle \| :silent NERDTreeMirror<CR>

" fix inline xml files
map <F4> :%s/></>\r</g <CR>

Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vividchalk'

Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>
set undodir=~/.vim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
" some undo
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Bundle 'vim-scripts/YankRing.vim'
" nnoremap <silent> <F11> :YRShow<CR>

filetype plugin indent on     " required! 


" =========================================================
" Filetype custom settings
" =========================================================

" remove all trailing whitespace for specified files before write
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

autocmd BufWritePre *.py :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.js :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.css :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.xml :call <SID>StripTrailingWhitespaces()

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2

" Add classic django templates tag's mappings to Surround
" http://code.djangoproject.com/wiki/UsingVimWithDjango#SurroundMappings
let g:surround_{char2nr("b")} = "{% block\1 \r..*\r &\1%}\r{% endblock %}"
let g:surround_{char2nr("i")} = "{% if\1 \r..*\r &\1%}\r{% endif %}"
let g:surround_{char2nr("w")} = "{% with\1 \r..*\r &\1%}\r{% endwith %}"
let g:surround_{char2nr("c")} = "{% comment\1 \r..*\r &\1%}\r{% endcomment %}"
let g:surround_{char2nr("f")} = "{% for\1 \r..*\r &\1%}\r{% endfor %}"
let g:surround_{char2nr("v")} = "{{ \1 \r..*\r &\1\r }}"


" =========================================================
" Basic settings
" =========================================================

syntax on                       " syntax highlighting
filetype on                     " try to detect filetypes
filetype plugin on              " enable loading indent file for filetype
set ruler                       " show line and column number
set cursorline                  " highlight current line with underline
set showcmd                     " show (partial) command in status line
set number                      " show line numbers
set title                       " show title in console title bar
set backupdir=~/tmp/vim//       " directory for swap files
set directory=~/tmp/vim//       " directory for backup files

" =========================================================
" Movin around/editing
" =========================================================

set backspace=2                 " allow backspacing over autoindent, EOL, and BOL
set nowrap                      " don't wrap text
set linebreak                   " don't wrap textin the middle of work
set expandtab                   " enter spaces when tab is pressed
set tabstop=4                   " use 4 spaces to represent tab
set softtabstop=4               " backspace over autoindent deletes spaces
set shiftwidth=4                " number of spaces to use for auto indent
set autoindent                  " copy indent from current line when starting a new line

set ignorecase                  " default to using case insensitive searches
set smartcase                   " unless uppercase letters are used in the regex
set hlsearch                    " highlight searches by default
set incsearch                   " incrementally search while typing a /regex

set foldmethod=indent           " allow us to fold on indents
set foldlevel=99                " don't fold by default

" Disable arrow keys in normal and insert mode
" inoremap  <Up>     <NOP>
" inoremap  <Down>   <NOP>
" inoremap  <Left>   <NOP>
" inoremap  <Right>  <NOP>
" noremap   <Up>     <NOP>
" noremap   <Down>   <NOP>
" noremap   <Left>   <NOP>
" noremap   <Right>  <NOP>

set pastetoggle=<F3>            " enable paste mode switching for F3 key

" Show a line at column 79
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Restore cursor position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif


" =========================================================
" Display - themes, messages, info
" =========================================================

colorscheme vividchalk
set background=dark             " using dark background in vim
set ls=2                        " always show status line
set statusline=%<%f\ (%{&ft})%=%-19(%3l,%02c%03V%)%{fugitive#statusline()}



" Add the virtualenv's site-packages to vim path
"py << EOF
"import os.path
"import sys
"import vim
"print sys.version
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    sys.path.insert(0, project_base_dir)
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
"EOF
