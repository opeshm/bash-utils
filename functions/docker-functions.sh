#!/bin/bash

function docker-volume-rm-all() {

  docker volume rm $(docker volume ls -q)

}

function docker-rm-all() {

  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)

}
