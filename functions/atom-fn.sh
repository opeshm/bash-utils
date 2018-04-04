#!/bin/bash

function atom-full-install () {
  atom-install
  atom-install-packages
}

function atom-install() {
  ATOM_DEB_URL="https://atom-installer.github.com/v1.25.0/atom-amd64.deb?s=1521055093&amp;ext=.deb"
  ATOM_DEB_PATH="${HOME}/tmp/atom-amd64.deb"

  mkdir -p ${HOME}/tmp
  wget -O ${ATOM_DEB_PATH} $ATOM_DEB_URL

  if [ -f ${ATOM_DEB_PATH} ]; then
    sudo apt install ${ATOM_DEB_PATH}
    rm ${ATOM_DEB_PATH}
  else
    echo "No se pudo descargar el paquete"
  fi
}

function atom-install-packages() {
  apm install atom-ide-ui
  apm install city-lights-icons
  apm install docker
  apm install language-docker
  apm install language-terra
  apm install language-terraform
  apm install minimap
  apm install minimap-autohider
  apm install platformio-ide-terminal
}
