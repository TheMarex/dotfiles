" Vim package management
execute pathogen#infect()

syntax on
filetype plugin indent on

" Ignore this files while doing file name completion
set wildignore+=*/tmp/*,*.so,*.swp

" Ctrl-P configuration
"
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_cmd = 'CtrlPMixed'

