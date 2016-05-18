" ~/.dotfiles/vim/vimrcs/mapping.vimrc
" This is my vimrc
"
"
"
" All mode
" mapping <leader>
let mapleader = "\<Space>"
" 設定滑鼠能用
set mouse=nvi

" Vistual mode

" Normal mode
" 為方便複製，用<F4>開啟/關閉行號顯示:
nnoremap <F4> :set nonumber!<CR>
" open NERDToggle with C-n
nnoremap <C-n> :NERDTreeToggle<CR>
" for auto clean the formate
nnoremap atft ggVG=
" Open Tagbar
nnoremap <F8> :TagbarToggle<CR>
" use space-w to save file
nnoremap <Leader>w :w<CR>
" C-5 for Compile+Run C-6 for Compile only
let SC = 0
nnoremap <F5> :w<CR> :SCCompileRun<CR>
nnoremap <F6> :SCViewResult<CR>
nnoremap <silent>[menu]g :Unite -silent -start-insert menu:git<CR>

" Insert mode

" Select mode

" Command mode
cabbr fs w !sudo tee %
cabbr pt set paste

" Plugin

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
