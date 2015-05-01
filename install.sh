#!/bin/bash
cd ~
git clone https://github.com/lukecampbell/vim-folder.git .vim
cd .vim
git submodule update --init
cd ~
ln -s .vim/vimrc .vimrc
