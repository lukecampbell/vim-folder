call pathogen#infect()
syntax on
filetype on
filetype indent on
filetype plugin on
set expandtab
set guifont=Menlo:h12
set tabstop=4
set shiftwidth=4
map <S-Enter> i<CR><Esc>
map <F2> :NERDTree <CR>
map <F3> <C-W><left>q
map <F4> :colorscheme Candy<CR>
map <F5> :colorscheme Eclipse<CR>
map <F6> :colorscheme VYLight<CR>
map <F7> :colorscheme Railscasts<CR>
set nocompatible
set cul
colorscheme Candy
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/
