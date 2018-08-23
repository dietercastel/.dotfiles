#!/bin/bash
# Install script for my dotfiles
# Should run by default on linux when the following is installed:
# On osx run 
#	./install.sh -osx
# - curl
# - git
# - fish
# - neovim

# Remember the installation directory for further use.
installdir=$(pwd)

# Creates symlink of the first argument to the second argument if the earllier does not exsist.
function symlinkNonExistent { 
	target=$1
	from=$2
	# Check if there is already such a file but it's not a symlink. Create backup.
	if [ -f $target ] && [ ! -L $target ]; then
		mv $target "$target.bckp"	
	fi
	if [ ! -d $(dirname $target) ]; then
		mkdir -p $(dirname $target)
	fi
	# If there is no such file, create symlyink.
	if [ ! -f $target ]; then
		ln -s "$installdir/$from" $target 
	fi
}

if [ "$1" -eq "-osx" ]; then
   	if ! grep -q "fish" /etc/shells; then
		echo $(which fish) >> /etc/shells
		chsh -s $(which fish)
	fi
fi

function main {
	# Symlink the config files.
	symlinkNonExistent ~/.config/fish/config.fish .bashrc
	symlinkNonExistent ~/.bashrc .bashrc
	symlinkNonExistent ~/.aliasrc .aliasrc
	symlinkNonExistent ~/.vimrc .vimrc
	symlinkNonExistent ~/.gitconfig .gitconfig

	
	# Small reminder.
	echo "Don't forget to restart the shell!!!"
}
main
