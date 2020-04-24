#!/bin/bash

export CODACY_PROJECT_TOKEN=$1
ARGS=$2
bash <(curl -Ls https://coverage.codacy.com/get.sh) $ARGS
