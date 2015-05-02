" Vim package management
execute pathogen#infect()

" General settings
"
set nocompatible
syntax on
filetype plugin indent on
set cc=80
set number

" Theme settings
"
set background=dark
colorscheme solarized
let g:solarized_bold=1
" toogles between light and dark
call togglebg#map("<F5>")

" Show tabs vs spaces
set listchars=tab:·\ ,trail:·
set list

" Airline settings
"
let g:airline_powerline_fonts = 1

" Ignore this files while doing file name completion
set wildignore+=*/tmp/*,*.so,*.swp

" Ctrl-P configuration
"
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_cmd = 'CtrlPMixed'

" YouCompleteMe configuration
"
let g:ycm_confirm_extra_conf=0

" Defaults
"
set ai et ts=4 sw=4 sts=4
autocmd BufEnter *.{js,json,geojson} set ai et sw=2 ts=2 sts=2
autocmd BufEnter *.html set ai et sw=2 ts=2 sts=2

