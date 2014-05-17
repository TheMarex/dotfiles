" Vim package management
call pathogen#infect('bundle')
call pathogen#helptags()

set runtimepath-=~/.vim/bundle/vim-latex

syntax on
set background=dark
let g:solarized_bold=1
let g:syntastic_full_redraws=1
colorscheme solarized
set ignorecase
set smartcase
set incsearch
set hlsearch
set cursorline
set cursorcolumn
set mouse=a
set guioptions+=a
set nocp
set backspace=2
filetype plugin on
set t_Co=256
set number
set cc=80
set ts=4
set nocompatible
let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*
set ssop-=options

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

highlight ColorColumn ctermbg=0

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2

set listchars=tab:·\ ,trail:·
"set listchars=tab:»·,trail:·
set list

" Defaults
autocmd BufEnter *.html set ai sw=2 ts=2
autocmd BufEnter *.c set ai sw=4 ts=4
autocmd BufEnter *.py set ai et ts=4 sw=4 sts=4
autocmd BufEnter *.tex set ai et ts=2 sw=2 sts=2
autocmd BufEnter *.s set ai et ts=4 sw=4 sts=4 syn=mips
autocmd BufEnter *.lua set ai et ts=4 sw=4 sts=4
autocmd BufEnter *.hs set ai et ts=4 sw=4 sts=4
autocmd BufEnter *.java set ai et sw=4 ts=4 sts=4
autocmd BufEnter *.cpp set ai sw=4 ts=4
autocmd BufEnter *.hpp set ai sw=4 ts=4
autocmd BufEnter *.h set ai sw=4 ts=4
autocmd BufEnter *.ino set ai sw=4 ts=4
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
autocmd BufEnter *.pp set ai

" alaCarte
autocmd BufEnter */alacarte/*/*.cpp set ai sw=4 ts=4 syntax=cpp11
" osrm
autocmd BufEnter */osrm/*.cpp set ai et sw=4 ts=4 sts=4 syntax=cpp11
autocmd BufEnter */osrm/*.hpp set ai et sw=4 ts=4 sts=4 syntax=cpp11
autocmd BufEnter */osrm/*.h set ai et sw=4 ts=4 sts=4 syntax=cpp11
autocmd BufEnter */osrm/*/*.cpp set ai et sw=4 ts=4 sts=4 syntax=cpp11
autocmd BufEnter */osrm/*/*.hpp set ai et sw=4 ts=4 sts=4 syntax=cpp11
autocmd BufEnter */osrm/*/*.h set ai et sw=4 ts=4 sts=4 syntax=cpp11

let g:ycm_autoclose_preview_window_after_insertion=0
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" Keybinding
call togglebg#map("<F5>")
vmap <C-c> "*y
vmap <C-v> "*p
nnoremap <C-h> <C-w>h
nnoremap <F3> :NumbersToggle<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap g[ :cs find 3 <C-R>=expand("<cword>")<CR><CR>
nnoremap g/ :cs find 0 <C-R>=expand("<cword>")<CR><CR>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
map <F9> :!/usr/bin/cscope -uUR<cr>
set tags=./tags;/

if has("cscope")
  set csprg=~/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
    " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
endif
