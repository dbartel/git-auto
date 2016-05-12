#!/bin/bash

GIT_DIR="."

pushd $GIT_DIR
git diff-files --quiet
if [[ $? != 0 ]]
then
    git commit -a -m "`date` auto-commit"
fi

