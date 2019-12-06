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
  gcloud compute scp --recurse $ROOT_DIR/scripts travis-app-vm:~
}


main() {
  sshToInstance
}

$@
