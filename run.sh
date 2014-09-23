#!/bin/sh

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

cp .vimrc ~/
vim +PluginInstall +qall
