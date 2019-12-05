#!/bin/bash
ROOT_DIR=$(pwd)

source $ROOT_DIR/.circleci/utils.sh

# checkout
sshToInstance() {
  gcloud compute ssh travis-app-vm
  sudo apt-get update
  sudo apt-get install nginx-light
}


main() {
  sshToInstance
}

$@