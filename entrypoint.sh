#!/bin/bash

export CODACY_PROJECT_TOKEN=$1
# comma separated list of report files
report_list=$2

IFS=','
report_array=$report_list
params=''
for report in $report_array
do
    if [ ! -z "$report" ]
    then
        params="$params -r $report"
    fi
done

bash <(curl -Ls https://coverage.codacy.com/get.sh) report $params --partial &&\
bash <(curl -Ls https://coverage.codacy.com/get.sh) final
