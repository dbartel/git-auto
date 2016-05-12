#!/bin/bash

# Checks if changes exist, commits them, and pushes them to a remote
# Use with cron for a primitive file sync

GIT_DIR="."

pushd $GIT_DIR

git diff-files --quiet
if [[ $? != 0 ]]
then
    git commit -a -m "`date` auto-commit"
    # Push branch
    if [ `git branch --list --remote origin/master` ]
    then
        git push origin master
    fi
fi

