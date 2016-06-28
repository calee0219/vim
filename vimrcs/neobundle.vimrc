"*****************************************************************************
"" NeoBundle core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')

let g:vim_bootstrap_langs = "javascript,ruby,haskell,lisp,elixir,python,c,php,html,lua,ocaml,perl,go,erlang"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"

  " Run shell script if exist on custom select language
  silent !\curl -sSL https://raw.githubusercontent.com/avelino/vim-bootstrap/master/vim_template/langs/haskell/haskell.sh | bash -s stable
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"*****************************************************************************
"" NeoBundle install packages
"*****************************************************************************
NeoBundle 'tpope/vim-sensible'              " sensible layout
NeoBundle 'scrooloose/nerdtree'             " NERDtree
NeoBundle 'jistr/vim-nerdtree-tabs.git'     " NERDtree
NeoBundle 'scrooloose/nerdcommenter'        " section comment
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'              " Git brange
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'Shougo/unite.vim'                " search and display
NeoBundle 'junegunn/fzf'                    " fuzzy finder
NeoBundle 'junegunn/fzf.vim'                " fzf and Vim
NeoBundle 'vim-airline/vim-airline'         " Apperence
NeoBundle 'vim-airline/vim-airline-themes'  " Apperence
NeoBundle 'Lokaltog/vim-powerline'			" Powerline for airline
"NeoBundle 'luochen1990/rainbow'             " better bracket looks
NeoBundle 'airblade/vim-gitgutter'          " Git useful tool
NeoBundle 'mhinz/vim-signify'               " Git useful tool
NeoBundle 'godlygeek/tabular'				" Auto arrange code
NeoBundle 'tpope/vim-endwise'				" Auto pair do end or so on
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'vim-scripts/CSApprox'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'jiangmiao/auto-pairs'            " auto complete brackets
NeoBundle 'majutsushi/tagbar'               " browse tags
NeoBundle 'scrooloose/syntastic'            " syntax checking
NeoBundle "Yggdroot/indentLine"
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Valloric/YouCompleteMe', {
	 \ 'build'      : {
		\ 'mac'     : './install.py',
		\ 'unix'    : './install.py',
		\ 'windows' : 'install.py',
		\ 'cygwin'  : './install.py'
		\ }
	 \ }

"" Vim-Session
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'

if v:version >= 703
  NeoBundle 'Shougo/vimshell.vim'
endif

if v:version >= 704
  "" Snippets
  NeoBundle 'SirVer/ultisnips'              " ultimate solution for snippets
  NeoBundle 'FelikZ/ctrlp-py-matcher'
endif

NeoBundle 'honza/vim-snippets'              " separated from engine

"" Color
NeoBundle 'tomasr/molokai'

"" Vim-Bootstrap Updater by sherzberg
NeoBundle 'avelino/vim-bootstrap-updater'

"" Custom bundles
"" Build, Compile, Run
NeoBundle 'xuhdev/SingleCompile'            " For compile and run in vim

"" Perl Bundle
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'c9s/perlomni.vim'

"" C++ Bundle
"NeoBundle 'vim-scripts/c.vim'
NeoBundle 'octol/vim-cpp-enhanced-highlight'

NeoBundle "jimenezrick/vimerl"

"" Lua Bundle
NeoBundle 'xolox/vim-lua-ftplugin'
NeoBundle 'xolox/vim-lua-inspect'

"" Lisp Bundle
NeoBundle 'vim-scripts/slimv.vim'

"" Javascript Bundle
NeoBundle 'jelera/vim-javascript-syntax'

"" HTML Bundle
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'tpope/vim-haml'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'

"" OCaml Bundle
NeoBundle "def-lkb/ocp-indent-vim"

"" Python Bundle
NeoBundle "davidhalter/jedi-vim"

"" Haskell Bundle
NeoBundle "eagletmt/neco-ghc"
NeoBundle "dag/vim2hs"
NeoBundle "pbrisbin/vim-syntax-shakespeare"

NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'carlosgaldino/elixir-snippets'

"" Go Lang Bundle
NeoBundle "fatih/vim-go"
NeoBundle "Blackrush/vim-gocode"

"" PHP Bundle
NeoBundle 'arnaud-lb/vim-php-namespace'

"" Ruby Bundle
NeoBundle "tpope/vim-rails"
NeoBundle "tpope/vim-rake"
NeoBundle "tpope/vim-projectionist"
NeoBundle "thoughtbot/vim-rspec"
NeoBundle "ecomba/vim-ruby-refactoring"

"" DBMS Bundle
NeoBundle 'chrisbra/csv.vim'                   " replace ',' for cvs

"" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
