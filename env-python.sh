#!/usr/bin/env bash

# install mysql, redis
apt_get_exists=$(command -v apt-get) || true
if [ $apt_get_exists ]; then
	# dependencies
	sudo apt-get install -y build-essential git wget mysql-server redis-server redis-tools
	
	if [ ! -d ~/anaconda ]; then
		wget https://repo.continuum.io/archive/Anaconda2-4.3.1-Linux-x86_64.sh -P ~
	fi
	
	if [ ! -d ~/anaconda3 ]; then
		wget https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh -P ~
	fi

elif [ `uname` == 'Darwin' ]; then
	# brew installation
	brew_exists=$(command -v brew) || true
	if [ ! $brew_exists ]; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
	brew install git wget mysql redis

	if [ ! -d ~/anaconda ]; then
		wget https://repo.continuum.io/archive/Anaconda2-4.3.1-MacOSX-x86_64.sh -P ~
	fi
	
	if [ ! -d ~/anaconda3 ]; then
		wget https://repo.continuum.io/archive/Anaconda3-4.3.1-MacOSX-x86_64.sh -P ~ 
	fi	
else 
	echo 'Not Support'
	exit 1
fi

# install anaconda
if [ ! -d ~/anaconda ]; then
	bash ~/Anaconda2-*.sh
fi

if [ ! -d ~/anaconda3 ]; then
	bash ~/Anaconda3-*.sh
fi

rm -rf ~/Anaconda*.sh

# Python Env
if [ ! -d ~/.bin ]; then
	mkdir -p ~/.bin
fi

rm $HOME/.bin/anaconda
ln -s $HOME/anaconda $HOME/.bin

echo "export PATH=$HOME/.bin/anaconda/bin:\$PATH" >> ~/.bash_profile 

DIR="$( cd "$( dirname "$0" )" && pwd )"
chmod -R 755 $DIR
sudo cp $DIR/bin/py-switch /usr/local/bin/pys
