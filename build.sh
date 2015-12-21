#!/bin/bash

set -e

#prepare
[ -d /local/build ] || mkdir -p /local/build
cd /local/build
git clone git://xenbits.xen.org/mini-os.git

#wget http://download.savannah.gnu.org/releases/lwip/older_versions/lwip-1.3.2.zip
#unzip lwip-1.3.2.zip
git clone git@github.com:Chunjie/lwip-for-minios.git -b 1.3.2

#build net app_main (without libc)
cd /local/build/mini-os
git apply mini-os-patch/0001-add-a-global-system-monitor-thread.patch
git apply mini-os-patch/0002-set-a-global-ip-address.patch
make LWIPDIR=/local/build/lwip-for-minios

#build main (with libc)

#pack

#clean
