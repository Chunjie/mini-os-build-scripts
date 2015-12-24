#!/bin/bash

set -e

CWD=`pwd`

#prepare
[ -d /local/build ] || mkdir -p /local/build
cd /local/build
#git clone git://xenbits.xen.org/mini-os.git
git clone git@github.com:Chunjie/mini-os-unikernel.git -b 2015-12-03

#wget http://download.savannah.gnu.org/releases/lwip/older_versions/lwip-1.3.2.zip
#unzip lwip-1.3.2.zip
git clone git@github.com:Chunjie/lwip-for-minios.git -b 1.3.2

#build net app_main (without libc)
cd /local/build/mini-os-unikernel
git apply $CWD/mini-os-patch/0001-add-a-global-system-monitor-thread.patch
git apply $CWD/mini-os-patch/0002-set-a-global-ip-address.patch
git apply $CWD/mini-os-patch/0003-add-key-handler-to-display-system-status.patch
make LWIPDIR=/local/build/lwip-for-minios

#build main (with libc)

#pack

#clean
