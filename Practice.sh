#!bin/bash
pkgname=${1}
userId=$(id -u)

if [[ $# -ne 1 ]] ; then
    echo "please pass input "
    exit 1
fi
if [[ ${userId} -ne 0 ]] ; then
    echo "you are not in root " 
    exit 2
fi

if command -v ${pkgname} 1>/dev/null 2>&1; then
    echo "this package ${pkgname} is already deployed" 
else
   yum install ${pkgname} -y
   yumexit=$?
   if [[ ${yumexit} -eq 0 ]] ; 
   then 
      echo " the package is installed sucessfully "
   else 
       echo " not installed "
   fi
fi