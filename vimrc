set expandtab
set guifont=Menlo:h12
set tabstop=4
set shiftwidth=4
map <S-Enter> i<CR><Esc>
map <F2> :NERDTree <CR>
map <F3> <C-W><left>q
map <F4> :colorscheme Candy
map <F5> :colorscheme Eclipse
map <F6> :colorscheme VYLight
map <F7> :colorscheme Railscasts
set nocompatible
set cul
call pathogen#infect()
syntax on
filetype on
filetype indent on
filetype plugin on
colorscheme Candy
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/
