" ~/.dotfiles/vim/vimrcs/display.vimrc
" This is my vimrc
"
"
"
" 檔案編碼
set encoding=utf-8
set fileencodings=utf-8,cp950
language en_US.UTF-8

"  Set line numbers
set number
" 設定目前行底線提示
set cursorline
" 高亮當前列 (垂直)
set cursorcolumn
" 顯示右下角詳細資訊
set ruler
" 顯示相對行號。
"set relativenumber
" 字數過長時換行。
set wrap
"set nowrap     " 不換行

"  Color
" Set syntax color
syntax on
set t_Co=256
" 擴充語法上色
"colorscheme kolor
colorscheme monokai
" Change background style
set background=dark " dark or light
" Change background and frontground color
"highlight Normal ctermfg=black ctermbg=white
" 在關鍵字還沒完全輸入完畢前就顯示結果
set incsearch

"  Set tab
" Set auto tab
" Copy the form of last line
set autoindent
" Specially work in C-like files
set cindent
set smartindent
" How long does tab truely is
set tabstop=4
" How long will backspace delet a space
set softtabstop=4
" How long when press tab
set shiftwidth=4
" Change tap to space
set expandtab
" 折疊
set foldenable
set foldmethod=syntax
set foldmethod=indent
set foldcolumn=1
"set foldlevel=1
" disable auto comment
setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" 套件

" NERDTree
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" change NERDTree default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 設定 NERDTree 視窗大小
let g:NERDTreeWinSize = 25
" set NERDTree bar on the right
"let NERDTreeWinPos="right"
" display bookmark
let NERDTreeShowBookmarks=1

" vim-airline
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
" set section
"let g:airline_section_a=''
"let g:airline_section_b=''
" set pwd
"let g:airline_section_c = '%{getcwd()}'
"let g:airline_section_gutter=''
"let g:airline_section_x=''
" set time
let g:airline_section_y = '%{strftime("%Y/%m/%d %H:%M")}'
"let g:airline_section_z=''
"let g:airline_section_warning=''
"let g:airline_section_error=''
" set status line
set laststatus=2
" enable powerline-fonts
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
"let g:airline_left_sep=''
let g:airline_right_sep=''

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_cpp_compiler_options = '-std=c++14'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:ycm_show_diagnostics_ui = 0

" tagbar
" set tagbar's width
let g:tagbar_width = 25

" rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
			\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
			\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
			\   'operators': '_,_',
			\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
			\   'separately': {
			\       '*': {},
			\       'tex': {
			\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
			\       },
			\       'lisp': {
			\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
			\       },
			\       'vim': {
			\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
			\       },
			\       'html': {
			\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
			\       },
			\       'css': 0,
			\   }
			\}

" Unite
let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
let g:unite_source_menu_menus.git = {
			\ 'description' : '            gestionar repositorios git
			\                            ⌘ [espacio]g',
			\}
let g:unite_source_menu_menus.git.command_candidates = [
			\['▷ tig                                                        ⌘ ,gt',
			\'normal ,gt'],
			\['▷ git status       (Fugitive)                                ⌘ ,gs',
			\'Gstatus'],
			\['▷ git diff         (Fugitive)                                ⌘ ,gd',
			\'Gdiff'],
			\['▷ git commit       (Fugitive)                                ⌘ ,gc',
			\'Gcommit'],
			\['▷ git log          (Fugitive)                                ⌘ ,gl',
			\'exe "silent Glog | Unite quickfix"'],
			\['▷ git blame        (Fugitive)                                ⌘ ,gb',
			\'Gblame'],
			\['▷ git stage        (Fugitive)                                ⌘ ,gw',
			\'Gwrite'],
			\['▷ git checkout     (Fugitive)                                ⌘ ,go',
			\'Gread'],
			\['▷ git rm           (Fugitive)                                ⌘ ,gr',
			\'Gremove'],
			\['▷ git mv           (Fugitive)                                ⌘ ,gm',
			\'exe "Gmove " input("destino: ")'],
			\['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
			\'Git! push'],
			\['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
			\'Git! pull'],
			\['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
			\'exe "Git! " input("comando git: ")'],
			\['▷ git cd           (Fugitive)',
			\'Gcd'],
			\]

" fzf
" This is the default extra key bindings
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'split',
			\ 'ctrl-v': 'vsplit' }
" Default fzf layout
" - down / up / left / right
" - window (nvim only)
let g:fzf_layout = { 'down': '~40%'  }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" You can use autoload functions to define your own command
autocmd VimEnter * command! Colors
			\ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})
