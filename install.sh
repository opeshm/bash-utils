#!/bin/bash
#
# Copyright (c) 2015 Mario Domínguez Gómez
# This file is part of bash-utils.
# Author: Mario Domínguez <opes_hm@yahoo.es>
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#


# =============================
# CLEAR TERMINAL
# =============================
clear

# =============================
# INITIAL CHECKS
# =============================
echo "CHECKING previous version... "
if [ "$BASHUTILS_VERSION" != "" ]; then
    echo -ne "Bash-utils previously installed.\n\n";
    exit 0;
fi

if [ -d ~/.bash-utils ]; then
    echo -en "Bash-utlils path exists.\n\n";
    exit 0;
fi 


# =============================
# DIRECTORY
# =============================
echo "CREATING bash-utils directory... "
mkdir -p ~/.bash-utils
cp -r ./src/* ~/.bash-utils


# =============================
# RC FILES
# =============================
# Add .bash-utils to .bashrc
if [ -f ~/.bashrc ]; then
    echo "BACKUP .bashrc"
    cp ~/.bashrc ~/.bashrc.bak.`date '+%Y%m%d%H%M%S'`
fi
echo "ADDING bash-utils to your bashrc file"
echo -ne "if [ -f ~/.bash-utils/bash-utils.sh ]; then\n    . ~/.bash-utils/bash-utils.sh\nfi\n" >> ~/.bashrc

# Add vimrc.conf to .vimrc with "source [file]"
echo "ADDING vimrc configuration to your vimrc"
if [ -f ~/.vimrc ]; then
    echo -ne "BACKUP .vimrc"
    cp ~/.vimrc ~/.vimrc.bak.`date '+%Y%m%d%H%M%S'`
    
    VIMRC_SOURCE=`grep -i .bash-utils/vimrc ~/.vimrc`
    if [ "${VIMRC_SOURCE}" == "" ]; then 
        echo -ne "source ~/.bash-utils/vimrc\n" >> ~/.vimrc
    fi
else 
    echo -ne "source ~/.bash-utils/vimrc\n" >> ~/.vimrc
fi

echo -ne "\nLOG OUT TO APPLY CHANGES\n\n"

exit 0;
