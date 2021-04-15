#!/bin/bash

# comma separated list of report files
report_list=$COVERAGE_REPORTS

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

bash <(curl -Ls https://coverage.codacy.com/get.sh) report $@ $params --partial &&\
bash <(curl -Ls https://coverage.codacy.com/get.sh) final $@
