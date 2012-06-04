function! GetDotLevel(lnum)
    let matchy = matchstr(getline(a:lnum), '^\(\.\+\)')
    if matchy == "-1"
        return 0
    else
        return strlen(matchy) / 2
    endif
endfunction

function! GetProfileFold(lnum)
    let ilevel = GetDotLevel(a:lnum)
    let sublevel = ilevel

    if a:lnum < line('$')
        let sublevel = GetDotLevel(a:lnum+1)
    endif

    if sublevel > ilevel
        return '>' . sublevel
    endif

    return ilevel
endfunction

set foldmethod=expr
set foldexpr=GetProfileFold(v:lnum)
set foldtext=getline(v:foldstart)
