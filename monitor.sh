#!/bin/bash
serviceName=${1}
if [[ -z "$serviceName" ]]; then
    echo "please pass value"
    exit 1
fi
LOG_FILE=/home/shiva/$(basename $0)_$(date '+%T').log
pc=$(ps -ef | grep "$serviceName" | grep -v grep | wc -l)
 echo " process count value: ${pc}" | tee -a ${LOG_FILE}
mailTo=anjiimuvva@gmail.com

if [[ $pc -eq 0 ]]; then
   echo "service $serviceName is not running" | tee -a ${LOG_FILE}
    echo "service $serviceName is not running" | mailx -s "Alert: $serviceName down" $mailTo
else
    echo "service $serviceName is up and running" | tee -a ${LOG_FILE}
    echo "service $serviceName is up and running"
fi