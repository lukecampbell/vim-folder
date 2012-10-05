function Github() range
    for linenum in range(a:firstline, a:lastline)
        let curr_line = getline(linenum)
    endfor

    execute "!github -f " . expand("%") . " -l " . a:firstline . " -n " . a:lastline
endfunction
com! -range Github call Github()
