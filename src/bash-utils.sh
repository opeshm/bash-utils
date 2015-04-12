#!/bin/bash

export BASHUTILS_VERSION='0.1'

# EXPORT VERSION VARIABLE
if [ ~/.bash-utils -d ]; then
    export PATH=${PATH}:~/.bash-utils
else
    exit 1;
fi

# ADDING ALIAS
if [ ~/.bash-utils/alias.conf -f ]; then
    . ~/.bash-utils/alias.conf
fi

