#!/bin/bash

function bu-custom-script-link () {

  SCRIPT_REAL_PATH=$(realpath $1)
  echo "${SCRIPT_REAL_PATH}"

  ln -nfs ${SCRIPT_REAL_PATH} ${BASHUTILS_DIR}/custom-scripts

}
