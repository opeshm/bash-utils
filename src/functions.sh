#!/bin/bash

# =============================
# VARIABLES
# =============================
if [[ $- == *i* ]]; then
    export bold=$(tput bold)
    export underline=$(tput sgr 0 1)
    export reset=$(tput sgr0)
    export purple=$(tput setaf 171)
    export red=$(tput setaf 1)
    export green=$(tput setaf 76)
    export tan=$(tput setaf 3)
    export blue=$(tput setaf 38)
fi

# =============================
# FUNCTIONS
# =============================
e_header() {
    echo "\n${bold}${purple}==========  ${@}  ==========${reset}\n"
}

e_arrow() {
    printf "➜ ${@}\n"
}

e_success() {
    printf "${green}✔ ${@}${reset}\n"
}

e_error() {
    printf "${red}✖ ${@}${reset}\n"
}

e_warning() {
    printf "${tan}➜ ${@}${reset}\n"
}

e_underline() {
    printf "${underline}${bold}${@}${reset}\n"
}

e_bold() {
    printf "${bold}${@}${reset}\n"
}

e_note() {
    printf "${underline}${bold}${blue}Note:${reset}  ${blue}${@}${reset}\n"
}


# =============================
# EXPORT FUNCTIONS
# =============================
export -f e_header
export -f e_arrow
export -f e_success
export -f e_error
export -f e_warning
export -f e_underline
export -f e_bold
export -f e_note
