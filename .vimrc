" Vim package management
execute pathogen#infect()

" General settings
"
set nocompatible
syntax on
filetype plugin indent on
set cc=80
set number
set smartcase
set incsearch
set hlsearch
set mouse=a
set guioptions+=a
set relativenumber

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
set wildignore+=*/tmp/*,*.so,*.swp,*.o

" Ctrl-P configuration
"
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|build|dist|test)|(\.(swp|ico|git|svn))$'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_max_files=0

" YouCompleteMe configuration
"
let g:ycm_confirm_extra_conf=0
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'

" Defaults
"
set ai et ts=4 sw=4 sts=4
autocmd BufEnter *.{js,json,geojson} set ai et sw=2 ts=2 sts=2
autocmd BufEnter *.html set ai et sw=2 ts=2 sts=2

" Clang format
"
let g:clang_format#detect_style_file=1
