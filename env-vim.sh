#!/usr/bin/env bash

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
echo "set nocompatible" >> ~/.vimrc
echo "filetype off" >> ~/.vimrc

# bundle.vim
echo "execute pathogen#infect()" >> ~/.vimrc
echo "set rtp+=~/.vim/bundle/Vundle.vim" >> ~/.vimrc
echo "call vundle#begin()" >> ~/.vimrc
echo "Plugin 'gmarik/Vundle.vim'" >> ~/.vimrc
echo "Plugin 'tpope/vim-fugitive'" >> ~/.vimrc
echo "Plugin 'L9'" >> ~/.vimrc
echo "Plugin 'git://git.wincent.com/command-t.git'" >> ~/.vimrc
echo "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}" >> ~/.vimrc
echo "Plugin 'user/L9', {'name': 'newL9'}" >> ~/.vimrc
echo "call vundle#end()" >> ~/.vimrc
echo "filetype plugin indent on" >> ~/.vimrc
echo "" >> ~/.vimrc

# plugins
echo "Plugin 'The-NERD-Tree'" >> ~/.vimrc
echo "Plugin 'AutoComplPop'" >> ~/.vimrc
echo "" >> ~/.vimrc

# vim keymaps
echo "nmap \` <ESC>:NERDTreeToggle<ENTER>" >> ~/.vimrc
echo "nmap rr <ESC><C-W>w" >> ~/.vimrc
echo "nmap ee yypb" >> ~/.vimrc
echo "nmap <C-i> <C-u>" >> ~/.vimrc
echo "nmap <C-k> <C-d>" >> ~/.vimrc
echo "nmap l :set nu!<ENTER>" >> ~/.vimrc
echo "" >> ~/.vimrc

# vim settings
echo "set smartindent" >> ~/.vimrc
echo "set hlsearch" >> ~/.vimrc
echo "set ignorecase" >> ~/.vimrc
echo "syntax on" >> ~/.vimrc
echo "set nu" >> ~/.vimrc
echo "set tabstop=4" >> ~/.vimrc
echo "set shiftwidth=4" >> ~/.vimrc
echo "set foldmethod=syntax" >> ~/.vimrc
echo "set foldlevelstart=1" >> ~/.vimrc
echo "let javaScript_fold=1" >> ~/.vimrc
echo "let perl_fold=1" >> ~/.vimrc
echo "let php_folding=1" >> ~/.vimrc
echo "let r_syntax_folding=1" >> ~/.vimrc
echo "let ruby_fold=1" >> ~/.vimrc
echo "let sh_fold_enabled=1" >> ~/.vimrc
echo "let vimsyn_folding='af'" >> ~/.vimrc
echo "let xml_syntax_folding=1" >> ~/.vimrc
echo "let g:javascript_plugin_jsdoc = 1" >> ~/.vimrc
echo "let g:javascript_plugin_ngdoc = 1" >> ~/.vimrc
echo "let g:javascript_plugin_flow = 1" >> ~/.vimrc
echo "set conceallevel=1" >> ~/.vimrc
echo "" >> ~/.vimrc
