#!/bin/sh
###########################################################
#
#  "Fetch and Run" xfile for remote administration
#
###########################################################

xhost=cfg.kl.com
xuser=cfg
xfile=$0.$$
xkey=~/.ssh/cfg.key

if [ $# -eq 1 ]
then
 scp -i $xkey ${xuser}@${xhost}:${1} ${xfile}
 if [ $? -eq 0 ]
 then
  head -n 1 $xfile | grep '#!' >/dev/null
  if [ $? -eq 0 ]
  then
   chmod u+x $xfile && $xfile
  else  
   sh $xfile
  fi  
 rm $xfile
 fi
else
 echo Usage: `basename $0` /file/at/$xhost
 exit 2
fi
