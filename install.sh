#!/bin/bash

if [ "$BASHUTILS_VERSION" != "" ]; then
    echo "Bash-utils previously installed";
    exit 1;
fi

mkdir -p ~/.bash-utils
cp -r ./src/* ~/.bash-utils

# TODO: Add .bash-utils to .bashrc

# TODO: Add vimrc.conf to .vimrc with "source [file]"


exit 0;
