" Vim package management
execute pathogen#infect()

syntax on
filetype plugin indent on

" Theme settings
"
set background=dark
colorscheme solarized
let g:solarized_bold=1
" toogles between light and dark
call togglebg#map("<F5>")

" Airline settings
"
let g:airline_powerline_fonts = 1

" Ignore this files while doing file name completion
set wildignore+=*/tmp/*,*.so,*.swp

" Ctrl-P configuration
"
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_cmd = 'CtrlPMixed'

