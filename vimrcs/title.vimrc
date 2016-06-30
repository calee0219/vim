" ~/.dotfiles/vim/vimrcs/tital.vimrc



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件標題
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新建.c,.h,.sh,.java文件，自動插入文件頭
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
"" 定義函數SetTitle，自動插入文件頭
func SetTitle()
    " .sh
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    " .python
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "")
    " .ruby
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    "  other filetype's title
    else
        call setline(1, "/*")
        call append(line("."), "* ================================================================================")
        call append(line(".")+1, "*")
        call append(line(".")+2, "*         > File Name:  ".expand("%"))
        call append(line(".")+3, "*      > Created Time:  ".strftime("%Y/%m/%d %a %X (%Z)"))
        call append(line(".")+4, "*")
        call append(line(".")+5, "*            > Author:  Gavin Lee (calee0219)")
        call append(line(".")+6, "*     > Organization:  National Chiao Tung University")
        call append(line(".")+7, "*             > Team:  NCTU_Ragnorok")
        call append(line(".")+8, "*             > Mail:  sz110010@gmail.com")
        call append(line(".")+9, "*")
        call append(line(".")+10, "* ================================================================================")
        call append(line(".")+11, "*/")
        call append(line(".")+12, "")
    endif
    " .cpp
    if expand("%:e") == 'cpp'
        call append(line(".")+13, "#include <bits/stdc++.h>")
        call append(line(".")+14, "#define IOS ios_base::sync_with_stdio(0);cin.tie(0)")
        call append(line(".")+15, "#define pb push_back")
        call append(line(".")+16, "#define mp make_pair")
        call append(line(".")+17, "#define mt make_tuple")
        call append(line(".")+18, "#define ff first")
        call append(line(".")+19, "#define ss second")
        call append(line(".")+20, "#define EPS 1E-7")
        call append(line(".")+21, "#define INF 0x7FFFFFFF")
        call append(line(".")+22, "#define PI 3.1415926535897932384626433832795")
        call append(line(".")+23, "")
        call append(line(".")+24, "using namespace std;")
        call append(line(".")+25, "")
        call append(line(".")+26, "typedef long long LL;")
        call append(line(".")+27, "")
        call append(line(".")+28, "int main()")
        call append(line(".")+29, "{")
        call append(line(".")+30, "    return 0;")
        call append(line(".")+31, "}")
    endif
    " .c
    if &filetype == 'c'
        call append(line(".")+13, "#include <stdlib.h>")
        call append(line(".")+14, "")
        call append(line(".")+15, "int main()")
        call append(line(".")+16, "{")
        call append(line(".")+17, "    return 0;")
        call append(line(".")+18, "}")
    endif
    " .h
    if expand("%:e") == 'h'
        call append(line(".")+8, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+9, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+10, "#endif")
    endif
    " .java
    if &filetype == 'java'
        call append(line(".")+8,"public class ".expand("%:r"))
        call append(line(".")+9,"")
    endif
    " 新建文件後，自動定位到文件末尾
endfunc
autocmd BufNewFile * normal G
autocmd BufNewFile *.cpp,*.c normal [[
