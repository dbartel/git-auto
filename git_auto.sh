#!/bin/bash

GIT_DIR="."

pushd $GIT_DIR
git diff-files --quiet
if [[ $? == 0 ]]
then
    echo "Dirty"
else
    echo "Nothing to do"
fi



