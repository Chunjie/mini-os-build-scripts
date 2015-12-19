#!/bin/bash

set -e

#prepare
[ -d /local/build ] || mkdir -p /local/build
cd /local/build
git clone git://xenbits.xen.org/mini-os.git
wget http://download.savannah.gnu.org/releases/lwip/older_versions/lwip-1.3.2.zip
unzip lwip-1.3.2.zip

#build net app_main (without libc)
cd /local/build/mini-os
patch -p1 < mini-os-patch/daytime-server-listen-address.patch
make LWIPDIR=/local/build/lwip-1.3.2

#build main (with libc)

#pack

#clean
