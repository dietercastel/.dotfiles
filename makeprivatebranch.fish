#!/usr/local/bin/fish
# Author: Dieter Castel
# This scripts sets up the current git repo for keybase private git mirroring.
# A full copy of the current branch is synced to your keybase URL filled out below
# AND a new 'private' branch is created where you can work on sensitive, not-yet ready features first.
#
# Usage ./git-make-private-keybase-branch --nopushcurrent keybase://newurl

#for option in $argv
#    switch "$option"
#        case -n --nopushcurrent
#        case \*
#            printf "error: Unknown option %s\n" $option
#    end
#end


set -x PRIVATE_KEYBASE_URL "keybase://YOURKEYBASEURLHERE"
set -x PRIVATE_BRANCHNAME "private"
set -x PRIVATE_REMOTENAME "kb-private"


#Push current master branch to new url 
git remote set-url --add --push origin $PRIVATE_KEYBASE_URL
git push

#Create new private branch
git checkout -b $PRIVATE_BRANCHNAME

# Add new remotes and fetch urls.
git config remote.$PRIVATE_REMOTENAME.url $PRIVATE_KEYBASE_URL
git config remote.$PRIVATE_REMOTENAME.fetch (echo "+refs/heads/*:refs/remotes/$PRIVATE_REMOTENAME/*")
git config branch.private.remote $PRIVATE_REMOTENAME
git config branch.private.merge 'refs/heads/private'

#Push private branch to keybase.
git push
