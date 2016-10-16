#!/bin/bash

###############################################################################
#
# Running the command using ftp
#
connect () {
 echo "${host}:"
 ssh $@ | while read line; do printf "\t${line}\n"; done
 echo
}

###############################################################################
#
# Confirming the running
#
ask_n_run () {
 if [ "$connect_all" = "y" ]; then
  connect $@;
 else
  read -p "Proceed with command \"$4\" at \"$1\"? [y,n,a,q]" answer

  case $answer in
   [Yy]* ) connect $@;;
   [Nn]* ) continue;;
   [Aa]* ) connect_all="y"; connect $@; continue;;
   * ) exit;;
  esac;

 fi
}

###############################################################################
#
# Host group selecting
#
ask_group () {
 read -p "Which group of hosts should I use [a]?
  a) Proxy servers
  b) VoIP servers
  x) exit
" answer

  case $answer in
  [Aa]* )
   hosts='/home/cfg/proxy/hosts'
   ikey='/home/cfg/proxy/mgmt.key'
   ;;
  [Bb]* )
   hosts='/home/cfg/voip/hosts'
   ikey='/home/cfg/voip/mgmt.key'
   ;;
  * ) exit;;
  esac
}

###############################################################################
#
# Show comman details
#
preview () {
 echo "The scrip is about to run \"$rcommand\" with the following options:"
 echo " hosts file: $hosts"
 echo " key file:   $ikey"
 echo
}

###############################################################################
#
# Main
#
connect_all="n"
rcommand=$@

ask_group
preview

for host in `cat ${hosts}`; do
 if [ "`echo $host | cut -b 1`" = "#" ]; then
  continue;
 fi
 ask_n_run ${host} "-l root" "-i ${ikey}" "${rcommand}";
done
