#!/bin/bash

# Checks if changes exist, commits them, and pushes them to a remote
# Use with cron for a primitive file sync

# Sync files with remote
sync_files() {
    git commit -a -m "`date` auto-commit"
    # Push branch
    if [ `git branch --list --remote origin/$BRANCH` ]
    then
        git push origin master
    fi  
}

# Repo to clone
REPO_DIR=$1

# Branch we're syncing
BRANCH=$2

# Go to our dir
pushd $REPO_DIR

# Check if files have changed
git diff-files --quiet

#Sync if necessary
if [[ $? != 0 ]]
then
    sync_files
fi

popd
exit 0

