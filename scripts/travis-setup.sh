#!/bin/bash
ROOT_DIR=$(pwd)

source $ROOT_DIR/scripts/utils.sh

activateServiceAccount() {
    require PROJECT_ID $PROJECT_ID
    require COMPUTE_ZONE $COMPUTE_ZONE
    require GCLOUD_SERVICE_KEY $GCLOUD_SERVICE_KEY

    info "Activate Google Service Account"

    echo $GCLOUD_SERVICE_KEY > $SERVICE_KEY_PATH
    gcloud auth activate-service-account --key-file $SERVICE_KEY_PATH
    gcloud --quiet config set project ${PROJECT_ID}
    gcloud --quiet config set compute/zone ${COMPUTE_ZONE}
}

main(){
    activateServiceAccount
}

$@