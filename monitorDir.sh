#!/bin/bash
LOG_FILE=/home/logs/
mailTO=anjiimuvva@gmail.com

if [[ ! -d ${LOG_FILE} ]]; then
    echo " the ${LOG_FILE} is not present" | mailx -s "Alert ${LOG_FILE} is deleted" ${mailTO}
    
fi
LATESTFILE=$(ls -ltr ${LOG_FILE} | awk 'NR==2{print$NF}')

if [[ -z ${LATESTFILE} ]]; then
   echo " ${LATESTFILE} is not preset" | mailx -s "Alert ${LATESTFILE} is deleted" ${mailTO}
   
fi
create=$(date -r ${LOG_FILE}/${LATESTFILE} '+%S')
present=$(date '+S')
Age=$((${create} - ${present} ))

AgeInHour=$(( Age / 3600 ))

if [[ ${AgeInHour} -gt 24 ]]; then

    echo " application not send files " | mailx -s "Alert ${LATESTFILE} is deleted" ${mailTO}
fi