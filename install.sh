#!/bin/bash
echo "$USER,welcome to your new device!"
echo "updating source.list..."
sudo apt-get update
echo "installing required software..."
sudo apt-get install zsh vim tmux git
echo "configuring oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "configuring vim..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
