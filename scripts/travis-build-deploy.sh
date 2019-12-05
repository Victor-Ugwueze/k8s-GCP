#!/bin/bash
ROOT_DIR=$(pwd)

source $ROOT_DIR/scripts/utils.sh

# checkout
installServer(){
  sudo apt-get update
  sudo apt-get install nginx-light -y
}

sshToInstance() {
  gcloud compute ssh travis-app-vm installServer
}


main() {
  sshToInstance
}

$@
