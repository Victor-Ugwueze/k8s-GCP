#!/bin/bash
ROOT_DIR=$(pwd)

source $ROOT_DIR/.circleci/utils.sh

# checkout
buildTagAndPushDockerImage() {
    require DOCKER_REGISTRY $DOCKER_REGISTRY
    require PROJECT_ID $PROJECT_ID
    require SERVICE_KEY_PATH $SERVICE_KEY_PATH
    require PROJECT_NAME $PROJECT_NAME

    IMAGE_NAME="gcr.io/$PROJECT_ID/$PROJECT_NAME"
    TAGGED_IMAGE=$IMAGE_NAME:${CIRCLE_SHA1}
    DOCKER_USERNAME=${DOCKER_USERNAME:-_json_key}

    info "Build docker image for app"
    info $IMAGE_NAME
  
    docker build -t $IMAGE_NAME -f $ROOT_DIR/.circleci/Dockerfile .

    info "Tagging built docker image as $TAGGED_IMAGE"
    docker tag $IMAGE_NAME $TAGGED_IMAGE
    is_success "Image successfully tagged $TAGGED_IMAGE"

    info "Login to $DOCKER_REGISTRY container registry"
    is_success_or_fail $(docker login -u  $DOCKER_USERNAME --password-stdin https://${DOCKER_REGISTRY} < $SERVICE_KEY_PATH)

    info "Push $TAGGED_IMAGE to $DOCKER_REGISTRY container registry"
    docker push $TAGGED_IMAGE

    info "Logout of docker container registry"
    is_success_or_fail $(docker logout https://${DOCKER_REGISTRY})

}

builAndDeployK8sConfiguration(){
    require PROJECT_NAME $PROJECT_NAME
    require PROJECT_ID $PROJECT_ID
    envsubst < $ROOT_DIR/.circleci/k8s-deploy.yml > ${HOME}/patched_k8s.yml
    info "Initiating deployment for image $TAGGED_IMAGE to $ENVIRONMENT environment"
    kubectl apply -f ${HOME}/patched_k8s.yml
    is_success "$TAGGED_IMAGE successfully deployed"
}

main() {
  buildTagAndPushDockerImage
  buildLintAndDeployK8sConfiguration
}

$@