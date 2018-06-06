#!/bin/bash

function docker-prune-all() {
  docker container prune -f; echo "Prune containers: $?"
  docker volume prune -f; echo "Prune volumes: $?"
  docker network prune -f; echo "Prune networks: $?"
  docker image prune -af; echo "Prune images: $?"
}

function docker-volume-rm-all() {

  docker volume rm $(docker volume ls -q)

}

function docker-rm-all() {

  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)

}
