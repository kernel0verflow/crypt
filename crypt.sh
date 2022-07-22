#!/bin/sh

if [ -d "$1" ]; then
    echo "$1 is a directory!"
    zip -r "$1.zip" $1
    gpg --recipient marcelschliwka@protonmail.com --encrypt "$1.zip"
    rm "$1.zip"
    exit 0
elif [ -f "$1" ] && [ "$1" != *gpg ]; then
    gpg --recipient marcelschliwka@protonmail.com --encrypt $1
elif [[ "$1" == *gpg ]]; then
    echo "You are right"
    gpg $1
    exit 0
else
    echo "Wrong Input, try again dude!"
    exit 1
fi
