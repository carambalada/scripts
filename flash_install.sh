#!/bin/sh

_file=/home/exti/Downloads/install_flash_player_11_linux.x86_64.tar.gz

tar xzf ${_file} --no-same-owner -C /
mv /libflashplayer.so /usr/lib/flashplugin-nonfree/libflashplayer.so
rm -fr /usr/lib64/ /usr/lib/kde4/ /usr/share/kde4/ /LGPL /readme.txt ${_file}
