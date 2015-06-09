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
	# If there is no such file, create symlyink.
	if [ ! -f $target ]; then
		ln -s "$installdir/$from" $target 
	fi
}

function main {
	# Symlink the config files.
	symlinkNonExistent ~/.bashrc .bashrc
	symlinkNonExistent ~/.aliasrc .aliasrc
	symlinkNonExistent ~/.vimrc .vimrc
	symlinkNonExistent ~/.gitconfig .gitconfig

	#Setup Vundle
	echo "Downloading Vundle" 
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo "Running Vundle"
	vim +PluginInstall +qall

	# Small reminder.
	echo "Don't forget to restart the shell!!!"
}
main
