#!/bin/bash

yes | gcloud compute ssh @root$COMPUTE_INSTANCE_NAME --command 'cd /k8s-GCP && git pull && ls && exit'
