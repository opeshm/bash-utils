#!/bin/bash

function bu-reload () {

  source ~/.bashrc
}

function bu-create-utils-project () {

  echo "Proyect name: "
  read BU_PROJECT_NAME
  BU_PROJECT_SLUG=$(echo ${BU_PROJECT_NAME} | iconv -t ascii//TRANSLIT | sed -r s/[^a-zA-Z0-9]+/-/g | sed -r s/^-+\|-+$//g | tr A-Z a-z)
  mkdir -p ${BASH_UTILS}/utils/${BU_PROJECT_SLUG}/{functions,scripts}
  touch ${BASH_UTILS}/utils/${BU_PROJECT_SLUG}/functions/default.sh
  touch ${BASH_UTILS}/utils/${BU_PROJECT_SLUG}/scripts/${BU_PROJECT_SLUG}
  chmod +x ${BASH_UTILS}/utils/${BU_PROJECT_SLUG}/scripts/${BU_PROJECT_SLUG}
  echo "New project: ${BASH_UTILS}/utils/${BU_PROJECT_SLUG}/"
}

function bu-add-utils-project () {
  cd ${BASH_UTILS}/utils/
  git clone ${1} 
  cd -
}

for UTIL_DIR in ${BASH_UTILS}/utils/**; do

  if [ -d ${UTIL_DIR}/scripts ]; then
    export PATH=${PATH}:$(realpath ${UTIL_DIR}/scripts/)
  fi

  if [ -d  ${UTIL_DIR}/functions ]; then 
    for FN_FILE in ${UTIL_DIR}/functions/*; do
      source $(realpath ${FN_FILE})
    done
  fi
done
