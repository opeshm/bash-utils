#!/bin/bash

function atom-full-install () {
  atom-install
  atom-install-packages
}

function atom-install() {
  snap install atom --classic
}

function atom-install-packages() {
  apm install docker
  apm install ide-bash
  apm install ide-docker
  apm install ide-json
  apm install ide-php
  apm install language-docker
  apm install language-terraform
  apm install minimap
  apm install minimap-autohider
  apm install nuclide
  apm install project-manager
  apm install teletype
}
