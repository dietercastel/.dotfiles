# Creates symlink of the first argument to the second argument if the earllier does not exsist.
function symlinkNonExsistent { 
	# Check if there is already such a file but it's not a symlink. Create backup.
	if [ -f $1 ] && [ ! -L $1 ]; then
		mv $1 "$1.bckp"	
	fi
	# If there is no such file, create symlyink.
	if [ ! -f $1 ]; then
		ln -s "$installdir/$2" $1 
	fi
}
# Remember the installation directory for further use.
installdir=$(pwd)
# Symlink the config files.
symlinkNonExsistent ~/.bashrc .bashrc
symlinkNonExsistent ~/.aliasrc .aliasrc
symlinkNonExsistent ~/.vimrc .vimrc
# Small reminder.
echo "Don't forget to restart the shell!!!"
