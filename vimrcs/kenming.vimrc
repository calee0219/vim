" ~/.vim/vimrcs/kenming.vimrc
" This script is colong from https://github.com/kenming/vimrc
"
"
"
" Check if exist Vundle plugin.
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim
    let iCanHazVundle=0
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/taglist.vim'
Bundle 'altercation/vim-colors-solarized'
" Plugin 'bling/vim-airline'
Plugin 'vim-scripts/winmanager'
Plugin 'vim-scripts/a.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'moll/vim-bbye'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" filetype plugin indent on    " required
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

" 文件類型自動識別, Vundle要求必須為off
" filetype on
filetype plugin on
filetype plugin indent on

"--------------
"" Color Scheme
"--------------
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized


"----------------
"" 編輯器基本設定
"----------------

" 默認顯示行號
set nu

" 設置（軟）製表符寬度為4：
set tabstop=4
set softtabstop=4
   
" 設置自動縮進：即每行的縮進值與上一行相等；使用 noautoindent 取消設置：
set autoindent
   
" 設置（自動）縮進的空格數為4
set shiftwidth=4
     
" 設置 使用 C/C++ 語言的自動縮進方式：
set cindent
     
" 智能縮進
set smartindent

"在狀態欄顯示正在輸入的命令
set showcmd
 
"為方便複製，用<F2>開啟/關閉行號顯示:
nnoremap <F2> :set nonumber!<CR>

"搜索的時候即時顯示結果
set incsearch
 
" 高亮搜索結果
set hlsearch
   
" 禁止循環查找
set nowrapscan
    
"  設置匹配模式，顯示匹配的括號
set showmatch

" 智能補全
set completeopt=longest,menu
  
" 設置歷史記錄為100條
set history=100

" 標尺，用於顯示光標位置的行號和列號，逗號分隔。每個窗口都有自己的標尺。如果窗口有狀態行，標尺在那裡顯示。否則，它顯示在屏幕的最後一行上。
set ruler
  
" 括號引號補全
:inoremap ( ()<ESC>i
:inoremap { {<CR>}<ESC>O
:inoremap [ []<ESC>i
   
" 摺疊設置
set foldmethod=syntax " 用語法高亮來定義摺疊
set foldlevel=100     " 啟動vim時不要自動摺疊代碼

" WinManager设置
" " NERD_Tree集成到WinManager
let g:NERDTree_title="[NERDTree]" 
function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

" 键盘映射，同时加入防止因winmanager和nerdtree冲突而导致空白页的语句
nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>
" 设置winmanager的宽度，默认为25
let g:winManagerWidth=30 
" 窗口布局
let g:winManagerWindowLayout='NERDTree|TagList'
" 如果所有编辑文件都关闭了，退出vim
let g:persistentBehaviour=0

"----------------
"" nerdtree 設定
"----------------
" 控制當游標移動超過一定距離時，是否自動將焦點調整到屏中心
let NERDTreeAutoCenter=1
" 指定鼠標模式（1.雙擊打開；2.單目錄雙文件；3.單擊打開）
" let NERDTreeMouseMode=2
" 是否默認顯示書籤列表
" let NERDTreeShowBookmarks=1
" 是否默認顯示文件
let NERDTreeShowFiles=1
" 是否默認顯示隱藏文件
" let NERDTreeShowHidden=1
" 是否默認顯示行號
" let NERDTreeShowLineNumbers=1
" 窗口位置（'left' or 'right'）
" let NERDTreeWinPos='left'
" 窗口寬
let NERDTreeWinSize=31

"----------------
"" taglist 設定
"----------------
let Tlist_Show_One_File=1        " 0為同時顯示多個文件函數列表,1則只顯示當前文件函數列表
let Tlist_Auto_Update=1
let Tlist_File_Fold_Auto_Close=1 " 非當前文件，函數列表摺疊隱藏
let Tlist_Exit_OnlyWindow=1      " 如果taglist是最後一個窗口，則退出vim 
let Tlist_Auto_Update=1          " Automatically update the taglist to include newly edited files.
" 把taglist窗口放在視窗的右側，預設在左側
" let Tlist_Use_Right_Window=1 
" 顯示taglist選單
" let Tlist_Show_Menu=1
" 啟動vim自動打開taglist
" let Tlist_Auto_Open=1
" ctags, 指定tags文件的位置,讓vim自動在當前或者上層文件夾中尋找tags文件
set tags=tags
" 添加系統調用路徑
set tags+=/usr/include/tags
" 鍵盤映射，更新tags & cscope
" nmap tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nmap tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *<CR> :set tags+=./tags<CR>:!cscope -Rbq<CR>:cs add ./cscope.out .<CR>

"----------------
"" Cscope 設定
"----------------
if has("cscope")
    set csprg=/usr/bin/cscope   "指定用來執行cscope的命令
    set csto=0                  " 設置cstag命令查找次序：0先找cscope數據庫再找標籤文件；1先找標籤文件再找cscope數據庫"
    set cst                     " 同時搜索cscope數據庫和標籤文件"
    set cscopequickfix=s-,c-,d-,i-,t-,e-    " 使用QuickFix窗口來顯示cscope查找結果"
    set nocsverb
    if filereadable("cscope.out")    " 若當前目錄下存在cscope數據庫，添加該數據庫到vim
        cs add cscope.out
    elseif $CSCOPE_DB != ""            " 否則只要環境變量CSCOPE_DB不為空，則添加其指定的數據庫到vim
        cs add $CSCOPE_DB
    endif
    set csverb
endif
" map <F4>:!cscope -Rbq<CR>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
 "對:cs find c等Cscope查找命令進行映射
nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>
" 設定是否使用 quickfix 窗口來顯示 cscope 結果
set cscopequickfix=s-,c-,d-,i-,t-,e-

