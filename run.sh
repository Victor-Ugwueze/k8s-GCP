#!/bin/bash

yes | gcloud compute ssh $COMPUTE_INSTANCE_NAME --command 'cd /k8s-GCP && git pull && ls && exit'
