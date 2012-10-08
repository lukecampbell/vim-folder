function! Github(line1, line2)
    execute "!github -f " . expand("%") . " -l " . a:line1 . " -n " . a:line2
endfunction
com! -range Github call Github(<line1>, <line2>)
