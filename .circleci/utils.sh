#!/bin/bash
set -e

BOLD='\e[1m'
BLUE='\e[34m'
RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[92m'
NC='\e[0m'


info() {
    printf "\n${BOLD}${BLUE}====> $(echo $@ ) ${NC}\n"
}

warning () {
    printf "\n${BOLD}${YELLOW}====> $(echo $@ )  ${NC}\n"
}

error() {
    printf "\n${BOLD}${RED}====> $(echo $@ )  ${NC}\n"; exit 1
}

success () {
    printf "\n${BOLD}${GREEN}====> $(echo $@ ) ${NC}\n"
}

is_success_or_fail() {
    if [ "$?" == "0" ]; then success $@; else error $@; fi
}

is_success() {
    if [ "$?" == "0" ]; then success $@; fi
}

# require "variable name" "value"
require () {
    if [ -z ${2+x} ]; then error "Required variable ${1} has not been set"; fi
}

SERVICE_KEY_PATH=$HOME/service-account-key.json

# assert required variables
# Production variables needed for deployment
require PRODUCTION_COMPUTE_ZONE $PRODUCTION_COMPUTE_ZONE
require PRODUCTION_CLUSTER_NAME $PRODUCTION_CLUSTER_NAME
require PROJECT_ID $PROJECT_ID
require PRODUCTION_PROJECT_NAME $PRODUCTION_PROJECT_NAME



export COMPUTE_ZONE=$PRODUCTION_COMPUTE_ZONE
export CLUSTER_NAME=$PRODUCTION_CLUSTER_NAME
export PROJECT_NAME=$PRODUCTION_PROJECT_NAME



export NAMESPACE=$ENVIRONMENT

