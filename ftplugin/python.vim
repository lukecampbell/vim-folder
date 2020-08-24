" Rewrap at 100, no auto-wrap
set tw=100 fo=cq

iabbrev @@p #!/usr/bin/env python
iabbrev @@t #!/usr/bin/env pytest
iabbrev @@c #-*- coding: utf-8 -*-


function! g:PythonModulePath()
    let @" = join(split(@%[0:-4], "/"), ".")
endfunction

function! s:SortImports()
    if exists('g:isort_args') && strlen(g:isort_args) > 0
        let sort_args = g:isort_args . " "
    else
        let sort_args = ""
    endif
    execute "!isort " . sort_args . bufname("%")
endfunction

command! SortImports :call s:SortImports()
nnoremap <leader>I :call g:PythonModulePath()<cr>
inoremap jf <ESC>mlF'if<ESC>`llli
