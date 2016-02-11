"hhyou version
" = =
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get out of VI's compatible mode..
set nocompatible

" Sets how many lines of history VIM have to remember
set history=400

" Set to auto read when a file is changed from the outside
set autoread

" Set map leader
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <LEADER>w :w!<CR>
nmap <LEADER>f :e ~/buffer<CR>

if has("win32") || has("win64")
    " Fast reloading of the _vimrc
    map <LEADER>s :source ~/_vimrc<CR>
    " Fast editing of _vimrc
    map <LEADER>e :e! ~/_vimrc<CR>
else
    " Fast reloading of the .vimrc
    map <LEADER>s :source ~/.vimrc<CR>
    " Fast editing of .vimrc
    map <LEADER>e :e! ~/.vimrc<CR>
endif

" See partial commands as you type
set showcmd

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use UTF-8 as default processing enc.
set encoding=utf-8

" File default encoding
set fileencoding=utf-8

" File encoding guess list
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1

" Terminal encoding
set termencoding=utf-8

" Treat ambiguous width as double width (ONLY work for unicode encoding)
set ambiwidth=double

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite file types
set ffs=unix,dos,mac

nmap <LEADER>fd :se ff=dos<CR>
nmap <LEADER>fu :se ff=unix<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FileType
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable file type plug-in
filetype plugin on
filetype indent on

autocmd! BufRead,BufNewFile *.conf set filetype=config

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Have the mouse enabled all the time:
"set mouse=a

" Keep at least 5 lines above/below
set scrolloff=5

" Keep at least 5 lines left/right
set sidescrolloff=5

" Turn on wild menu
set wildmenu

" Always show current position
set ruler

" The command bar is 2 high
set cmdheight=2

" Show line number
set number

" Do not redraw while running macros (much faster) (LazyRedraw)
set lazyredraw

" Fast terminal
set ttyfast

" Change buffer without saving
set hidden

" Set backspace
set backspace=start,indent,eol

" Backspace and cursor keys wrap to
set whichwrap+=<,>,h,l

" Set magic on
set magic

" No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

" Show matching braces
set showmatch

" Show full completion tags
set showfulltag

" How many tenths of a second to blink (Bracket blinking)
"set mat=2

" Windows size
if has("win32") || has("win64")
    set columns=120
    set lines=60
endif

" Enable syntax highlighting
syntax enable

    """"""""""""""""""""""""""""""
    " Colors and Fonts
    """"""""""""""""""""""""""""""
    " Set font
    if has("win32") || has("win64")
        set gfn=Consolas:h10
    endif

    "if has("gui_running")
    "    set guioptions-=T
    "    colorscheme wombat
    "else
    "    if &term == "xterm-color" || &term == "xterm-16color"
    "        " Set the color level
    "        set t_Co=16
    "	    colorscheme yzlin
    "    else
    "        " Set the color level
    "        set t_Co=256
    "	    colorscheme yzlin256
    "    endif
    "endif

    """"""""""""""""""""""""""""""
    " Cursor line
    """"""""""""""""""""""""""""""
    " Highlight current line in Insert Mode
    set cursorline
    
    "function! s:EnterInsert()
    "    set cursorline
    "endfunction

    "function! s:LeaveInsert()
    "    set nocursorline
    "endfunction

    "autocmd InsertLeave * call s:LeaveInsert()
    "autocmd InsertEnter * call s:EnterInsert()

    " Set cursorline
    "hi cursorline cterm=none ctermbg=darkgrey

    " Omni menu colors
    "hi Pmenu ctermbg=darkgrey
    "hi PmenuSel ctermbg=darkblue

    " Pattern matching
    "hi MatchParen ctermbg=11


    """"""""""""""""""""""""""""""
    " Status line
    """"""""""""""""""""""""""""""
    " Always hide the status line
    set laststatus=2

    set statusline=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}
    set rulerformat=%15(%c%V\ %p%%%)
    
    fun! FileTime()
        let ext = tolower(expand("%:e"))
        let fname = tolower(expand('%<'))
        let filename = fname . '.' . ext
        let msg = ""
        let msg = msg . " " . strftime("(Modified %b,%d %y %H:%M:%S)", getftime(filename))
        return msg
    endf

    fun! CurTime()
        let ftime = ""
        let ftime = ftime . " " . strftime("%b,%d %y %H:%M:%S")
        return ftime
    endf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" Incremental search
set incsearch

" Highlight search things
set hlsearch

" Make search wrap around
set wrapscan

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab configuration
nmap <LEADER>tc :tabnew<CR>
nmap <LEADER>te :tabedit<SPACE>
nmap <LEADER>tk :tabclose<CR>
nmap <C-H> :tabprev<CR>
nmap <C-L> :tabnext<CR>

" Last used tab switching
autocmd TabLeave * let g:LastUsedTabPage = tabpagenr()
function! SwitchLastUsedTab()
    if exists("g:LastUsedTabPage")
        execute "tabnext " g:LastUsedTabPage
    endif
endfunction
nmap tt :call SwitchLastUsedTab()<CR>

set switchbuf=usetab

" Always show tab line
set showtabline=2

" Tab line format
function! TabLine()
    let s = ''
    for i in range(1, tabpagenr('$'))
        let hiBG = ((i == tabpagenr()) ? '%#TabLineSel#' : '%#TabLine#')
        let winnr = tabpagewinnr(i, '$')
        "let filename = bufname(tabpagebuflist(i)[winnr - 1])
        let filename = bufname(tabpagebuflist(i)[0])
        if (filename == '')
            let filename = '=No Name='
        endif
        let s .= hiBG . ' '
        if (winnr > 1)
            let s .= '[' . i . '-' . winnr . '] '
        else
            let s .= '[' . i . '] '
        endif
        "let s .= substitute(filename, '.\+\/', '', 'g')
        let s .= filename
        let s .= (1 == gettabwinvar(i, 1, '&modified') ? '[+]' : '')
        let s .= ' '
        let i += 1
    exe | endfor
    let s .= '%#TabLineFill#'
    return s
endfunction
set tabline=%!TabLine()

"hi TabLine      cterm=NONE      ctermfg=fg      ctermbg=236
"hi TabLineFill  cterm=NONE      ctermfg=fg      ctermbg=236
"hi TabLineSel   cterm=NONE      ctermfg=fg      ctermbg=64

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Comment for C like languages
autocmd BufNewFile,BufRead *.js,*.htc,*.c,*.tmpl,*.css inoremap $c /**<CR>  **/<ESC>O

" My information
iab xdate <C-R>=strftime("%d/%m/%y %H:%M:%S")<CR>
iab xname hhyou
iab xemail hhyou@cs.nctu.edu.tw

" Bash like
cnoremap <C-B> <HOME>
cnoremap <C-E> <END>
cnoremap <C-K> <C-U>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noexpandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set backspace=2
set smarttab
set linebreak
set textwidth=500

    """"""""""""""""""""""""""""""
    " Indent
    """"""""""""""""""""""""""""""
    " Auto indent
    set autoindent

    " Smart indent
    set smartindent

    " C-style indenting
    set cindent

    " Wrap lines
    set wrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spelllang=en

hi clear SpellBad
hi SpellBad term=underline cterm=underline ctermfg=red

map <LEADER>sn ]s
map <LEADER>sp [s
map <LEADER>sa zg
map <LEADER>s? z=
map <F5> :set spell!<CR><BAR>:echo "Spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickfix window
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -bang -nargs=? QFix call QFixToggle(<bang>0)

function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
        unlet g:qfix_win
    else
        copen 10
        let g:qfix_win = bufnr("$")
    endif
endfunction

nnoremap <leader>q :QFix<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug-in configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    """"""""""""""""""""""""""""""
    " Taglist
    """"""""""""""""""""""""""""""
    if has("unix")
        let Tlist_Ctags_Cmd = "/usr/local/bin/exctags"
    elseif has("mac") || has("macunix")
        let Tlist_Ctags_Cmd = "/usr/bin/ctags"
    elseif has("win32") || has("win64")
        let Tlist_Ctags_Cmd = "C:/ctags.exe"
    endif

    " 自動更新目前的 tag 列表
    let Tlist_Auto_Update = 1

    " 顯示的 tag 排序方式：name/order
    let Tlist_Sort_Type = "name"

    " Tlist 視窗的寬度
    let Tlist_WinWidth = 30

    " 是否只顯示目前文件的 tag
    let Tlist_Show_One_File = 0

    " 關閉文件的同時，也關閉taglist視窗
    let Tlist_Exit_OnlyWindow = 1

    let Tlist_Use_SingleClick = 1

    " Tlist window at the right side
    let Tlist_Use_Right_Window = 1

    " Automatically close the folds for the non-active files
    let Tlist_File_Fold_Auto_Close = 1

    " Process files even when the taglist window is not open
    let Tlist_Process_File_Always = 1

    " Enable fold column to display the folding for the tag tree
    let Tlist_Enable_Fold_Column = 0

    " hot key
    nnoremap <F3> :TlistToggle<CR>

    """"""""""""""""""""""""""""""
    " Cscope
    """"""""""""""""""""""""""""""
    if has("cscope")
        "set csprg=/usr/local/bin/cscope
        set cscopetagorder=0
        set cscopetag
        set cscopeverbose
        set cscopetag
        "set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-

        " add any database in current directory
        if filereadable("cscope.out")
            cs add cscope.out
        " else add database pointed to by environment
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
    endif

    """"""""""""""""""""""""""""""
    " Nerd Tree
    """"""""""""""""""""""""""""""
    nnoremap <F4> :NERDTreeToggle<CR>

    """"""""""""""""""""""""""""""
    " OmniCppComplete
    """"""""""""""""""""""""""""""
    map <F6> :!exctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

    """"""""""""""""""""""""""""""
    " YankRing
    """"""""""""""""""""""""""""""
    let g:yankring_history_dir = "$HOME/.vim/temp/"

    """"""""""""""""""""""""""""""
    " SmoothPageScroll
    """"""""""""""""""""""""""""""
    let g:smooth_page_scroll_delay = 5
    "nmap <C-F> :call SmoothPageScrollDown()<CR>
    "nmap <C-B> :call SmoothPageScrollUp()<CR>

    """"""""""""""""""""""""""""""
    " Ku.vim
    """"""""""""""""""""""""""""""
    nnoremap <LEADER>kb :<C-u>Ku buffer<CR>
    nnoremap <LEADER>kf :<C-u>Ku file<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M
noremap <LEADER>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" Remove indenting on empty lines
noremap <F2> :%s/\s*$//g<CR>:noh<CR>''

" Super paste
"inoremap <C-V> <ESC>:set paste<CR>mui<C-R>+<ESC>mv'uV'v=:set nopaste<CR>

" Visual Tab
set listchars=tab:>-,trail:-,eol:$,nbsp:%,extends:>,precedes:<
noremap <LEADER>st :set list<CR>
noremap <LEADER>ct :set nolist<CR>

" Fast ydict
noremap <LEADER>y viwy:!clear; ydict <C-R>"<CR>

" Fast Big5 Mode
noremap <LEADER>b :e ++enc=big5<CR>:set tenc=big5<CR>:set fenc=big5<CR>

" When editing a file, always jump to the last known cursor position.
" Don’t do it when the position is invalid or when inside an event handle
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     execute "normal g`\"" |
    \ endif

" Quick window resize
noremap + <C-W>+
noremap - <C-W>-
" noremap = <C-W>=

highlight comment ctermfg=darkgreen guifg=darkgreen

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Group setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SGML (For FDP Indentation)
augroup sgml
    autocmd!
    function! _sgml()
        set formatoptions=cq2l  " Special formatting options
        set textwidth=70        " Wrap lines at 70 columns
        set shiftwidth=2        " Automatically indent
        set softtabstop=2       " Tab key indents 2 spaces
        set tabstop=8           " Replace 8 spaces with a tab
        set autoindent          " Automatic indentation
    endfunction
    autocmd FileType sgml call _sgml()
augroup END

" C/C++
augroup cplusplus
    autocmd!
    function! _cplusplus()
        set shiftwidth=4
        set softtabstop=4
        set tabstop=4
        "set expandtab

        " None of these should be word dividers, so make them not be
        set iskeyword+=_,@,#

"        " indent
"        if executable("/usr/local/bin/gindent")
"            set equalprg=/usr/local/bin/gindent
"        else
"            set equalprg=/usr/bin/indent
"        endif
    endfunction
    autocmd FileType c,cpp call _cplusplus()
augroup END

" Python
augroup python
    autocmd!
    function! _python()
        set shiftwidth=3
        set softtabstop=3
        set tabstop=3
        set expandtab
        set tags+=$HOME/.vim/tags/python
    endfunction
    autocmd FileType python call _python()
augroup END

" Perl
augroup perl
    autocmd!
    function! _perl()
        set shiftwidth=3
        set softtabstop=3
        set tabstop=3
        set expandtab

        " indent by perltidy
        if executable("/usr/local/bin/perltidy")
            set equalprg=perltidy
        endif
    endfunction
    autocmd FileType perl call _perl()
augroup END

" PHP
augroup php
    autocmd!
    function! _php()
        set shiftwidth=3
        set softtabstop=3
        set tabstop=3
        set makeprg=php\ -l\ %
        set errorformat=%m\ in\ %f\ on\ line\ %l

        " None of these should be word dividers, so make them not be
        set iskeyword+=_,@,#

        nmap <silent> <F12>
            \ :!exctags -f %:p:h/tags
            \ --langmap="php:+.inc"
            \ -h ".php.inc" -R --totals=yes
            \ --tag-relative=yes --PHP-kinds=+cf-v %:p:h<CR>

        " Highlight SQL syntax in string
        let php_sql_query=0

        " Highlight HTML in string
        let php_htmlInStrings=0

        " Disable short tags
        let php_noShortTags=1

        " Folding for classes & functions
        let php_folding=1
    endfunction
    autocmd FileType php call _php()
augroup END

