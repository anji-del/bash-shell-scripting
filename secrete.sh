#!/bin/bash

secreteFile="db.sh"
mailTo="anjiimuvva@gmail.com"
for (( ; ;))
  do
    sleep 60
if [[ ! -e "${secreteFile}" ]]; then
    echo "The file does not exist"
    echo "This file ${secreteFile} was deleted on host: $(hostname)" \
        | mailx -s "Alert: ${secreteFile} deleted" "${mailTo}"
fi
done
