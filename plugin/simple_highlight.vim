function! HighlightRegion(color)
  hi Green guibg=#77ff77
  hi Red guibg=#ff7777
  let l_start = line("'<")
  let l_end = line("'>") + 1
  execute 'syntax region '.a:color.' start=/\%'.l_start.'l/ end=/\%'.l_end.'l/'
endfunction

vnoremap <leader>g :<C-U>call HighlightRegion('Green')<CR>
vnoremap <leader>r :<C-U>call HighlightRegion('Red')<CR>
