#!/bin/bash
ROOT_DIR=$(pwd)

source $ROOT_DIR/scripts/utils.sh

# checkout
# installServer(){
  # sudo apt-get update
  # sudo apt-get install nginx-light -y
# }

sshToInstance() {
  ls $TRAVIS_BUILD_DIR/
  gcloud compute scp --recurse $TRAVIS_BUILD_DIR/  travis-app-vm:~
}


main() {
  sshToInstance
}

$@
