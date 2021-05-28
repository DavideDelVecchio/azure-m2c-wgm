#!/bin/bash

# Bash script to reinstall mongo on macOS with homebrew.
# Chris Joakim, Microsoft, May 2021

# brew mongodb-database-tools ?

echo 'brew uninstall mongodb-community@4.4 ...'
brew uninstall mongodb-community@4.4

echo 'brew cleanup ...'
brew cleanup

echo 'removing files ...'
rm -rf /usr/local/var/log/mongodb/ 
rm -rf /usr/local/var/mongodb 

echo 'brew tap mongodb/brew ...'
brew tap mongodb/brew

echo 'brew install mongodb-community@4.4 ...'
brew install mongodb-community@4.4

# Output from brew install mongodb-community@4.4
# ...
# ==> mongodb-community@4.4
# mongodb-community@4.4 is keg-only, which means it was not symlinked into /usr/local,
# because this is an alternate version of another formula.

# If you need to have mongodb-community@4.4 first in your PATH, run:
#   echo 'export PATH="/usr/local/opt/mongodb-community@4.4/bin:$PATH"' >> /Users/cjoakim/.bash_profile

# To have launchd start mongodb/brew/mongodb-community@4.4 now and restart at login:
#   brew services start mongodb/brew/mongodb-community@4.4
# Or, if you don't want/need a background service you can just run:
#   mongod --config /usr/local/etc/mongod.conf

echo 'listing installed programs in /usr/local/opt/mongodb-community@4.4/bin ...'
ls -al /usr/local/opt/mongodb-community@4.4/bin

echo 'add /usr/local/opt/mongodb-community@4.4/bin to $PATH'

echo 'exit this shell, open another shell to this director, then:'
echo '$ ./macos_set_file_limits.sh'
echo '$ mongo --version'
echo '$ mongod --config /usr/local/etc/mongod.conf &'
echo '$ ps aux | grep mongod'
echo '$ mongo'

# $ which mongo
# /usr/local/opt/mongodb-community@4.4/bin/mongo
# [~/github/cj-tech]$ mongo --version
# MongoDB shell version v4.4.5


