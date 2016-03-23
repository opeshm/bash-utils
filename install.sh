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
# FUNCTIONS
# =============================
function ReadYesNo {
    echo -en "${1} [Y/n]: "
    read OPT_YN

    if [ "${OPT_YN}" != "Y" ] && [ "${OPT_YN}" != "y" ] && [ "${OPT_YN}" != "" ]; then
        return 1;
    fi
    
    return 0;
}


# =============================
# VARIABLES
# =============================
BACKUP_SUFIX=`date '+%Y%m%d%H%M%S'`
BASHRC_SOURCE=`grep -i .bash-utils/bash-utils.sh ${HOME}/.bashrc`
VIMRC_SOURCE=
if [ -f ${HOME}/.vimrc ]; then
    VIMRC_SOURCE=`grep -i .bash-utils/vimrc ${HOME}/.vimrc`
fi


# =============================
# INITIAL CHECKS
# =============================
echo "CHECKING previous version... "
if [ -d ~/.bash-utils ]; then
    ReadYesNo "Bash-utlils path exists.\nOverride?"
    if [ $? -ne 0 ]; then
        exit 0;
    fi
fi 


# =============================
# DIRECTORY
# =============================
echo "CREATING bash-utils directory... "
if [ -d ~/.bash-utils ]; then
    rm -rf ~/.bash-utils
fi 
mkdir -p ~/.bash-utils
cp -r ./src/* ~/.bash-utils


# =============================
# RC FILES
# =============================
# Add .bash-utils to .bashrc
echo "ADDING bash-utils to your bashrc file"
if [ "${BASHRC_SOURCE}" == "" ]; then

    # backup bashrc
    ReadYesNo "Backup ${HOME}/.bashrc?"

    if [ $? -ne 0 ]; then
        cp ${HOME}/.bashrc ${HOME}/.bashrc.bak.${BACKUP_SUFIX}
        echo "BACKUP ${HOME}/.bashrc -> ${HOME}/.bashrc.bak.${BACKUP_SUFIX}"
        exit 0;
    fi

    echo -ne "if [ -f ~/.bash-utils/bash-utils.sh ]; then\n    . ~/.bash-utils/bash-utils.sh\nfi\n" >> ${HOME}/.bashrc
fi


# Add vimrc.conf to .vimrc with "source [file]"
echo "ADDING vimrc configuration to your vimrc"
if [ -f ${HOME}/.vimrc ]; then

    if [ "${VIMRC_SOURCE}" == "" ]; then 

        # backup vimrc
        ReadYesNo "Backup ${HOME}/.vimrc?"

        if [ $? -ne 0 ]; then
            cp ${HOME}/.vimrc ${HOME}/.vimrc.bak.${BACKUP_SUFIX}
            echo "BACKUP ${HOME}/.vimrc -> ${HOME}/.vimrc.bak.${BACKUP_SUFIX}"
            exit 0;
        fi
        
        echo -ne "source ~/.bash-utils/vimrc\n" >> ~/.vimrc
    fi
else 
    echo -ne "source ~/.bash-utils/vimrc\n" > ${HOME}/.vimrc
fi


# =============================
# EXIT
# =============================
echo -ne "\nLOG OUT TO APPLY CHANGES.\n\n"
exit 0;
