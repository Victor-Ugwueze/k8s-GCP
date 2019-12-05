#!/bin/bash
ROOT_DIR=$(pwd)

source $ROOT_DIR/scripts/utils.sh

# checkout
# installServer(){
  # sudo apt-get update
  # sudo apt-get install nginx-light -y
# }

sshToInstance() {
  gcloud compute scp $TRAVIS_BUILD_DIR --recurse travis-app-vm
}


main() {
  sshToInstance
}

$@
