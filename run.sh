#!/bin/bash

yes | gcloud compute ssh victorugwueze@$COMPUTE_INSTANCE_NAME --command 'cd /k8s-GCP && sudo chmod +x ./start.sh && exit'
