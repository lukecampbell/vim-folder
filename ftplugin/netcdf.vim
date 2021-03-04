function! s:ToggleNCView()
    " Before wiping the buffer make sure we can modify the buffer
    setlocal noreadonly modifiable
    " Delete the contents of the buffer
    %d
    " Read ncdump -h <filepath of buffer> into the buffer at line 2
    read !ncdump -h %
    " Delete line 1 which is empty as a consequence of how read !<cmd> works
    1,1d
    " Set the filetype to CDL to get that sweet syntax highlighting
    let &ft="cdl"
    " Don't let the user be dumb and save the text CDL content over the netCDF
    " file.
    setlocal readonly nomodified noswapfile nomodifiable
endfunction


call <SID>ToggleNCView()
