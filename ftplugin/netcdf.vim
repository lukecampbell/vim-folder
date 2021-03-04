function! s:ToggleNCView()
    setlocal noreadonly modifiable
    %d
    read !ncdump -h %
    1,1d
    let &ft="cdl"
    setlocal readonly nomodified noswapfile nomodifiable
endfunction


call <SID>ToggleNCView()
