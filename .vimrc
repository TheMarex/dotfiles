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
set completeopt-=preview

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

highlight ColorColumn ctermbg=0

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2

set listchars=tab:·\ ,trail:·
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
autocmd BufEnter *.js set ai et sw=4 ts=4 sts=4

" alaCarte
autocmd BufEnter */alacarte/*/*.cpp set ai sw=4 ts=4 syntax=cpp11
" osrm
autocmd BufEnter */osrm/*.cpp set ai et sw=4 ts=4 sts=4 syntax=cpp11
autocmd BufEnter */osrm/*.hpp set ai et sw=4 ts=4 sts=4 syntax=cpp11
autocmd BufEnter */osrm/*.h set ai et sw=4 ts=4 sts=4 syntax=cpp11
autocmd BufEnter */osrm/*/*.cpp set ai et sw=4 ts=4 sts=4 syntax=cpp11
autocmd BufEnter */osrm/*/*.hpp set ai et sw=4 ts=4 sts=4 syntax=cpp11
autocmd BufEnter */osrm/*/*.h set ai et sw=4 ts=4 sts=4 syntax=cpp11

autocmd BufEnter */humanoidlocomotion/*/*.h set ai et sw=4 ts=4 sts=4 syntax=cpp11
autocmd BufEnter */humanoidlocomotion/*/*.cpp set ai et sw=4 ts=4 sts=4 syntax=cpp11
autocmd BufEnter */simdynamicsviewer/*/*.h set ai et sw=4 ts=4 sts=4 syntax=cpp11
autocmd BufEnter */simdynamicsviewer/*/*.cpp set ai et sw=4 ts=4 sts=4 syntax=cpp11

let g:ycm_autoclose_preview_window_after_insertion=0
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" Keybinding
call togglebg#map("<F5>")
nnoremap <C-h> <C-w>h
nnoremap <F3> :NumbersToggle<CR>
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>
"nnoremap g[ :cs find 3 <C-R>=expand("<cword>")<CR><CR>
"nnoremap g/ :cs find 0 <C-R>=expand("<cword>")<CR><CR>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"let g:UltiSnipsExpandTrigger="<c-m>"
"let g:UltiSnipsJumpForwardTrigger="<c-m>"

