#!/bin/sh

source_dir=/home/exti/Downloads

# Firefox
ch_ff () {
 target_dir=/opt
 source_pattern="firefox*.bz2"
 source_file=$(ls ${source_dir}/${source_pattern}) 2>/dev/null
 if [ -z $source_file ]; then
  echo No updates for Firefox
  return
 else
  tar xf $source_file --no-same-owner -C ${target_dir}
  rm $source_file
  echo Firefox was updated from $source_file
 fi
}

# Flash Player
ch_fl () {
 target_dir=/
 source_pattern="install_flash*"
 source_file=$(ls ${source_dir}/${source_pattern}) 2>/dev/null
 if [ -z $source_file ]; then
  echo No updates for Flash Player
  return
 else
  tar xzf $source_file --no-same-owner -C ${target_dir}
  mv /libflashplayer.so /usr/lib/flashplugin-nonfree/libflashplayer.so
  rm -fr /usr/lib64/ /usr/lib/kde4/ /usr/share/kde4/ /LGPL /readme.txt ${source_file}
  echo Flash Player was updated from $source_file
 fi
}

ch_ff
ch_fl
