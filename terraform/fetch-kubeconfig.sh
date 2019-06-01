#!/bin/bash

gcloud config set project gabriel-garrido
gcloud container clusters get-credentials terraform-test-cluster --zone us-central1-b --project gabriel-garrido
