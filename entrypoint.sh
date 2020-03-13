#!/bin/bash

export CODACY_PROJECT_TOKEN=$1
wget -qO - https://coverage.codacy.com/get.sh | sh
