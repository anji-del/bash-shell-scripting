#!/bin/bash
COMMAND=/bin/command
TR=/usr/bin/tr
AWK=/usr/bin/awk
ECHO=/bin/echo
CAT=/usr/bin/cat
MAILX=/usr/bin/mailx

# --- Check Docker ---
if ${COMMAND} -v docker >/dev/null 2>&1; then
    DOCKER=$(${COMMAND} -v docker)
    dockerver=$(${DOCKER} --version | ${AWK} '{print $3}' | ${TR} -d ',')
else
    dockerver="not found"
fi

# --- Check Ansible ---
if ${COMMAND} -v ansible >/dev/null 2>&1; then
    ANSIBLE=$(${COMMAND} -v ansible)
    ansiblever=$(${ANSIBLE} --version | ${AWK} 'NR==1 {print $2}')
else
    ansiblever="not found"
fi

# --- Check Java ---
if ${COMMAND} -v java >/dev/null 2>&1; then
   JAVA=$(${COMMAND} -v java)
    javaver=$(${JAVA} -version 2>&1 | ${AWK} 'NR==1 {print $3}' | ${TR} -d '"')
else
    javaver="not found"
fi

# --- Check Nginx ---
if ${COMMAND} -v nginx >/dev/null 2>&1; then
    NGINX=$(${COMMAND} -v nginx)
    nginxver=$(${NGINX} -v 2>&1 | ${AWK} -F'/' '{print $2}')
else
    nginxver="not found"
fi

# --- Print to console (optional) ---
${ECHO} " ToolName          Versioninfo "
${ECHO} " docker            ${dockerver}"
${ECHO} " ansible           ${ansiblever}"
${ECHO} " java              ${javaver}"
${ECHO} " nginx             ${nginxver}"

${CAT} << EOF | ${MAILX} -s "$(${ECHO} -e "Devops tool info $(hostname))" anjiimuvva@gmail.com

EOF