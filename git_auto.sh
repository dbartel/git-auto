#!/bin/bash

# Checks if changes to a repository exist, commits them, and pushes them to a remote
# Use with cron for a primitive file sync

# Sync files with remote
sync_files() {
    git checkout $BRANCH
    git add .
    git commit -m "`date` auto-committed by $USER"
    # Push branch
    if [[ $REMOTE ]]
    then
        git push origin $BRANCH
    fi  
}

# Repo to clone
REPO_DIR=$1

# Remote we're syncing to
REMOTE=$2

# Branch we're syncing
BRANCH=$3


# Go to our dir
pushd $REPO_DIR

# Check if files have changed
git diff-files --quiet
CHANGED_FILES=$?

# Check if new files
git ls-files --other --directory --exclude-standard | sed q1 > /dev/null
NEW_FILES=$?

echo $CHANGED_FILES
echo $NEW_FILES

#Sync if necessary
if [[ $CHANGED_FILES || $NEW_FILES ]]
then
    sync_files
fi

popd
exit 0

