#!/bin/bash

export CODACY_PROJECT_TOKEN=$1
export REPORT_FILE=$2

if [ -z "$REPORT_FILE" ]; then
    bash <(curl -Ls https://coverage.codacy.com/get.sh)
else
    bash <(curl -Ls https://coverage.codacy.com/get.sh) report -r "$REPORT_FILE"
fi
