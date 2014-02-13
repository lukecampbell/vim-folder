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
map <F8> :colorscheme BClear<CR>
map <F9> :colorscheme Molokai<CR>
map <C-\> :rightbelow split<CR>:exec("tag ".expand("<cword>"))<CR>
set nocompatible
set cul
colorscheme Molokai
let mapleader = ","
inoremap jj <ESC>
inoremap jl <C-r>"
inoremap <C-h> <ESC>^i
inoremap <C-l> <ESC>A
"nnoremap / /\v
"vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set nu
set hlsearch
set laststatus=2
set statusline=%f\ %y\ %{fugitive#statusline()}\ [%l,%c]
set scrolloff=5
nnoremap \] gt
nnoremap \[ gT
nnoremap <C-h> ^
nnoremap <C-l> $
nnoremap <leader><space> :noh<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>s :Gwrite<cr>
nnoremap <leader>- 80a-<ESC>
nnoremap <leader>w :wq<cr>
nnoremap <leader>c :cq<cr>
nnoremap <leader>k vf,hc
nnoremap <leader>l vf'hc
nnoremap <leader>L vf"hc
nnoremap <leader>h :Hexmode<cr>
nnoremap <leader>o :set nowrap<cr>
nnoremap <leader>O :set wrap<cr>
nnoremap <leader>b :set relativenumber<cr>
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>B :set nu<cr>
nnoremap <leader>tb :TagbarToggle<cr>
nnoremap <leader>N :windo diffoff<cr>
nnoremap <tab> %
vnoremap <tab> %
command! Wipe bufdo bd

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/
let g:syntastic_check_on_open=1


" ctrl+p options
let g:ctrlp_map='<Leader>p'
" let g:ctrlp_user_command = 'git ls-files'
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files', 'find %s -type f']
" Use Ag in lieu of ack
let g:ackprg = 'ag --nogroup --nocolor --column'
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

