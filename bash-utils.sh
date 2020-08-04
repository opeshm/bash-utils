#!/bin/bash

# =============================
# EXPORT VERSION VARIABLE
# =============================
export BASHUTILS_VERSION='0.3.1'
export BASHUTILS_DIR="${HOME}/.bash-utils"

# =============================
# ADDING COMPLETION
# =============================
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

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

export PATH=${PATH}:~/.bash-utils/custom-scripts
