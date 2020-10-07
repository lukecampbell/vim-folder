" Rewrap at 100, no auto-wrap
set tw=100 fo=cq

iabbrev @@p #!/usr/bin/env python
iabbrev @@t #!/usr/bin/env pytest
iabbrev @@c #-*- coding: utf-8 -*-
iabbrev @@k *args, **kwargs


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


function! s:Pydoc(module)
    new
    "echom "echo " . shellescape(a:module)
    let cmd = "0read !pydoc " . shellescape(a:module)
    execute cmd
    setlocal buftype=nofile bufhidden=hide noswapfile nomodifiable
    normal gg
endfunction

function! s:PydocCursor()
py3 << EOF
from ast import Import, ImportFrom
import pydoc
import vim
import ast

def search(keyword, module):
    for node in ast.walk(module):
        if isinstance(node, Import):
            for alias in node.names:
                if alias.asname and alias.asname == keyword:
                    return alias.name
                if alias.name == keyword:
                    return alias.name
        if isinstance(node, ImportFrom):
            for alias in node.names:
                if alias.asname:
                    if alias.asname == keyword:
                        return f'{node.module}.{alias.name}'
                else:
                    if alias.name == keyword:
                        return f'{node.module}.{alias.name}'
def main():
    keyword = vim.eval("expand('<cword>')")
    buf = '\n'.join(vim.current.buffer)
    module = ast.parse(buf)
    mod = search(keyword, module)
    if not mod:
        return
    vim.command('call s:Pydoc("' + mod + '")')
main()
EOF
endfunction



command! -nargs=1 Pydoc :call s:Pydoc("<args>")

command! SortImports :call s:SortImports()
nnoremap <leader>I :call g:PythonModulePath()<cr>
nnoremap <S-k> :call <SID>PydocCursor()<cr>
nnoremap <C-k> :call <SID>EditModule()<cr>
inoremap jf <ESC>mlF'if<ESC>`llli

if exists("*s:EditModule")
    finish
endif

function! s:EditModule()
py3 << EOF
from ast import Import, ImportFrom
from pathlib import Path
import pydoc
import vim
import ast
from importlib import import_module

def search(keyword, module):
    for node in ast.walk(module):
        if isinstance(node, Import):
            for alias in node.names:
                if alias.asname and alias.asname == keyword:
                    return alias.name
                if alias.name == keyword:
                    return alias.name
        if isinstance(node, ImportFrom):
            for alias in node.names:
                if alias.asname:
                    if alias.asname == keyword:
                        return f'{node.module}'
                else:
                    if alias.name == keyword:
                        return f'{node.module}'

def convert_to_package(alias):
    return alias.replace('.', '/') + '/__init__.py'

def convert_to_module(alias):
    return alias.replace('.', '/') + '.py'


def edit_file(path, keyword):
    vim.command('new')
    vim.command('edit ' + str(path))
    vim.command('/' + keyword)
    #vim.command('new ' + str(path))

def main():
    keyword = vim.eval("expand('<cword>')")
    buf = '\n'.join(vim.current.buffer)
    module = ast.parse(buf)
    mod = search(keyword, module)
    if not mod:
        print('No import defined')
        return
    package_path = Path(convert_to_package(mod))
    if package_path.exists():
        edit_file(package_path, keyword)
        return
    module_path = Path(convert_to_module(mod))
    if module_path.exists():
        edit_file(module_path, keyword)
        return
    module_path = Path(import_module(mod).__file__)
    edit_file(module_path, keyword)

main()
EOF
endfunction
