#!/bin/bash

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

function e_header() {
    echo "\n${bold}${purple}==========  ${@}  ==========${reset}\n"
}

function e_arrow() {
    printf "➜ ${@}\n"
}

function e_success() {
    printf "${green}✔ ${@}${reset}\n"
}

function e_error() {
    printf "${red}✖ ${@}${reset}\n"
}

function e_warning() {
    printf "${tan}➜ ${@}${reset}\n"
}

function e_underline() {
    printf "${underline}${bold}${@}${reset}\n"
}

function e_bold() {
    printf "${bold}${@}${reset}\n"
}

function e_note() {
    printf "${underline}${bold}${blue}Note:${reset}  ${blue}${@}${reset}\n"
}
