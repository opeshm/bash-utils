#!/bin/bash

# =============================
# EXPORT VERSION VARIABLE
# =============================
export BASHUTILS_VERSION='0.3'

# =============================
# EXPORT PATH
# =============================
PATHSCRIPTS=`echo ${PATH} | grep -i bash-utils/scripts`
if [ "${PATHSCRIPTS}" == "" ]; then
    export PATH=${PATH}:~/.bash-utils/scripts
fi

# =============================
# ADDING ALIAS
# =============================
if [ -f ~/.bash-utils/alias.sh ]; then
    . ~/.bash-utils/alias.sh
fi

# =============================
# ADDING FUNCTIONS
# =============================
if [ -f ~/.bash-utils/functions.sh ]; then
    . ~/.bash-utils/functions.sh
fi

