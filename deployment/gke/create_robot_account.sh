#!/bin/bash
# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

PROJECT_ID=$1
NAME="website-robot"
SERVICE_ACCOUNT="$NAME@$PROJECT_ID.iam.gserviceaccount.com"

# Create service account
gcloud iam service-accounts create $NAME

# Enable service account
gcloud alpha iam service-accounts enable $SERVICE_ACCOUNT

# Get the robot account key
gcloud iam service-accounts keys create website-robot-key.json \
    --iam-account website-robot@$PROJECT_ID.iam.gserviceaccount.com

# Use the same robot account for website and mixer
cp website-robot-key.json mixer-robot-key.json