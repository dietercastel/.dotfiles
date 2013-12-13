# Creates symlink of the first argument to the second argument if the earllier does not exsist.
function symlinkNonExsistent { 
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
