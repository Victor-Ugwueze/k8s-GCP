#!/bin/bash
ROOT_DIR=$(pwd)

source $ROOT_DIR/scripts/utils.sh

# checkout
# installServer(){
# sudo apt-get update
# sudo apt-get install nginx-light -y
# }

sshToInstance() {
  info "Copying files"
  gcloud compute ssh travis-app-vm -- cd "sduo apt-get update; sudo apt-get install nginx-light"
}


main() {
  sshToInstance
}

$@
