#!/bin/bash

function git-branch-clean() {

  GIT_CAP_BRANCH=${1}
  GIT_HEAD_BRANCH=`git branch -a  | grep origin/HEAD | cut --delimiter=\> -f2 | cut --delimiter=/ -f2 `

  git checkout ${GIT_HEAD_BRANCH}

  for b in $(git branch | grep -v ^\*); do
    git branch -D "$b"
  done

}

function git-cap() {
  GIT_CAP_BRANCH=${1}
  GIT_HEAD_BRANCH=`git branch -a  | grep origin/HEAD | cut --delimiter=\> -f2 | cut --delimiter=/ -f2 `

  git checkout ${GIT_HEAD_BRANCH}
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

# Alias
alias g-commit='git commit -m '
alias g-status='git status '
alias g-add='git add '
alias g-diff='git diff '
