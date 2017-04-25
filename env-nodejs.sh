#!/usr/bin/env bash

# install mysql, redis
apt_get_exists=$(command -v apt-get) || true
if [ $apt_get_exists ]; then
	# dependencies
	sudo apt-get install -y build-essential git wget mysql-server redis-server redis-tools
elif [ `uname` == 'Darwin' ]; then
	# brew installation
	brew_exists=$(command -v brew) || true
	if [ ! $brew_exists ]; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
	brew install git wget mysql redis
else 
	echo 'Not Support'
	exit 1
fi

# install node.js
sudo wget https://raw.githubusercontent.com/tj/n/master/bin/n
sudo chmod 755 n
sudo mv n /usr/bin/
sudo n stable

# install useful global libraries
sudo npm install -g grunt forever gulp bower nodemon lwot 
