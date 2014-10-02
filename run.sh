#!/bin/sh

set -e

cd `dirname $0`

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim

cp .vimrc ~/
vim +PluginInstall +qall

sw_vers -productVersion 2>/dev/null 1>&2

if [ $? -eq 0 ]
then
	which brew 2>/dev/null 1>&2

	if [ $? -ne 0 ]
	then
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
fi

cd ~/.vim/bundle/YouCompleteMe
./install.sh
