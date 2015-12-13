#!/bin/bash

set -e

#prepare
[ -d /local/build ] || mkdir -p /local/build
cd /local/build
git clone git://xenbits.xen.org/mini-os.git
wget http://download.savannah.gnu.org/releases/lwip/lwip-1.4.1.zip
unzip lwip-1.4.1.zip

#build
cd /local/build/mini-os
make -I /local/build/lwip-1.4.1/src/include

#pack

#clean
