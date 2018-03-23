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
