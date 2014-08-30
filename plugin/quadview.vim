function! s:quadview()
    split
    windo vsplit
endfunction

command! Quadview :call s:quadview()
