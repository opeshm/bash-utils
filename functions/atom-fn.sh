#!/bin/bash

function atom-full-install () {
  atom-install
  atom-install-packages
}

function atom-install() {
  sudo snap install atom --classic
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
