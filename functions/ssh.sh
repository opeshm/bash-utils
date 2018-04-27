#!/bin/bash

function sshA {
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/id_rsa
}
