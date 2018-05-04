#!/bin/bash

function git-branch-clean() {

  git checkout master

  for b in $(git branch | grep -v ^\*); do
    git branch -D "$b"
  done

}

function git-cap() {
  GIT_CAP_BRANCH=${1}

  git checkout master
  git pull
  git branch ${GIT_CAP_BRANCH}
  git checkout ${GIT_CAP_BRANCH}
  git push --set-upstream origin ${GIT_CAP_BRANCH}

}

function install-git-kraken () {
  sudo apt install --y wget libgnome-keyring-dev libcanberra-gtk3-module libcanberra-gtk-module
  wget -P /tmp/gitkraken-amd64.deb "https://release.gitkraken.com/linux/gitkraken-amd64.deb"
  sudo apt install -y /tmp/gitkraken-amd64.deb/gitkraken-amd64.deb
}
