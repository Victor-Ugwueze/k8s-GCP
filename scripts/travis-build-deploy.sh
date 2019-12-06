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
  gcloud compute ssh command "apt-get update; apt-get install nginx-light"
}


main() {
  sshToInstance
}

$@
