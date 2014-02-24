#!/bin/bash

# For Ubuntu 12.04 LTS

username=$1

# Setup sources.list
pwd=`pwd`

if [ -f "$pwd/sources.list" ]; then
	cp /etc/apt/sources.list /etc/apt/sources.list.bak
	cp $pwd/sources.list /etc/apt/sources.list
else
	echo "Need sources.list!"
	exit
fi

# apt-get
add-apt-repository ppa:fcwu-tw/ppa #Add Vim74 ppa source
apt-get update
apt-get install openssh-server
apt-get install vim
apt-get install git
apt-get install build-essential
apt-get install cmake

# Vim
tools_path="/home/$username/Tools"
mkdir -p $tools_path
chown $username:$username $tools_path
git clone https://github.com/Nginlion/vimcfg.git $tools_path/vimcfg
cp /home/$username/Tools/vimcfg/vimrc /home/$username/.vimrc
git clone https://github.com/gmarik/vundle.git /home/$username/.vim/bundle/vundle
git clone https://github.com/tomasr/molokai.git $tools_path/molokai
mkdir -p /home/$username/.vim/colors
cp $tools_path/molokai/molokai.vim /home/$username/.vim/colors
chown -R $username:$username /home/$username/.vim/colors
apt-get install python-dev
sh /home/$username/.vim/bundle/YouCompleteMe/install.sh --clang-completer 
# Need to use BundleInstall to install the Vim plugins
