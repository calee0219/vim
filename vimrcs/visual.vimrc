"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set number
"" info right down
set ruler
"" highlight row
set cursorline
"" highlight col
set cursorcolumn
"" relatively line number
"set relativenumber
"" change line
set wrap
"" don't changeline
"set nowrap

"" Colors
let no_buffers_menu=1
if !exists('g:not_finsh_neobundle')
  colorscheme molokai
endif

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

" Change background style
set background=dark " dark or light
" Change background and frontground color
"highlight Normal ctermfg=black ctermbg=white

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1


  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif

endif

if &term =~ '256color'
  set t_ut=
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
"" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
"" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
"" enable powerline-fonts
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
"let g:airline_left_sep=''
let g:airline_right_sep=''
"" set section
"let g:airline_section_a=''
"let g:airline_section_b=''
"let g:airline_section_c ='%{getcwd()}'
"let g:airline_section_gutter=''
"let g:airline_section_x=''
"let g:airline_section_y = ''
"let g:airline_section_z=''
"let g:airline_section_warning=''
let g:airline_section_error='%{strftime("%Y/%m/%d %H:%M")}'

" NERDTree
"" set NERDTree bar on the right
"let NERDTreeWinPos="right"
"" display bookmark
let NERDTreeShowBookmarks=1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" tagbar
"" set tagbar's width
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
"" This is the default extra key bindings
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'split',
			\ 'ctrl-v': 'vsplit' }
"" Default fzf layout
"" - down / up / left / right
"" - window (nvim only)
let g:fzf_layout = { 'down': '~40%'  }
"" Customize fzf colors to match your color scheme
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
"" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
"" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
"" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
"" You can use autoload functions to define your own command
autocmd VimEnter * command! Colors
			\ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})
