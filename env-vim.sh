#!/usr/bin/env bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

apt_get_exists=$(command -v apt-get) || true

if [ $apt_get_exists ]; then
	# dependencies
	sudo apt-get install -y vim
elif [ `uname` == 'Darwin' ]; then
	# brew installation
	brew_exists=$(command -v brew) || true
	if [ ! $brew_exists ]; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
	brew install vim
else 
	echo 'Not Support'
	exit 1
fi

# vim plugins
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ ! -d ~/.vim/bundle/nerdtree ]; then
	git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
fi

# vimrc
mv ~/.vimrc ~/.vimrc.backup
rm ~/.vimrc
cp $DIR/src/vimrc ~/.vimrc
