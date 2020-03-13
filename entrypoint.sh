#!/bin/bash

export CODACY_PROJECT_TOKEN=$1
bash <(curl -Ls https://coverage.codacy.com/get.sh)
