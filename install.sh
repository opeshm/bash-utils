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
BASH_UTILS_INSTALL_PATH="${PWD}/$(dirname $BASH_SOURCE)"
BACKUP_SUFIX=`date '+%Y%m%d%H%M%S'`
BASHRC_SOURCE=`grep -i BASH_UTILS ${HOME}/.bashrc`

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

    echo -ne "\nexport BASH_UTILS=${BASH_UTILS_INSTALL_PATH}\n" >> ${HOME}/.bashrc
    echo -ne "\nsource \$BASH_UTILS/bash-utils.sh\n" >> ${HOME}/.bashrc
fi

source ${HOME}/.bashrc
echo -ne "\nLOG OUT TO APPLY CHANGES.\n\n"
exit 0;
