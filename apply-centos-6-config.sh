#!/bin/bash

set -e

CWD=`pwd`
centos_conf_dir=$CWD/CentOS-6

num_of_nic=`find /sys/class/net -name eth* | wc -l`
if [ $num_of_nic -lt 2 ]; then
    echo "Installation requires at least 2 NICs, but we only have $num_of_nic NIC."
    exit 1;
fi

echo "apply network bridge interface configuration ..."
cp $centos_conf_dir/ifcfg-xenbr0 /etc/sysconfig/network-scripts/. # public network
cp $centos_conf_dir/ifcfg-xenbr1 /etc/sysconfig/network-scripts/. # private network

echo "apply network eth interface configuration ..."
cd /etc/sysconfig/network-scripts/
sed -e "s,ONBOOT=.*,ONBOOT=yes,g" ifcfg-eth0 > ifcfg-eth0
sed -e "s,BOOTPROTO=\(.*\),# BOOTPROTO=\1,g" ifcfg-eth0 > ifcfg-eth0 # ip address is attached to xenbr0, not eth0
echo "BRIDGE=xenbr0" >> ifcfg-eth0
sed -e "s,ONBOOT=.*,ONBOOT=yes,g" ifcfg-eth1 > ifcfg-eth1
sed -e "s,BOOTPROTO=\(.*\),# BOOTPROTO=\1,g" ifcfg-eth1 > ifcfg-eth1 # ip address is attached to xenbr1, not eth1
echo "BRIDGE=xenbr1" >> ifcfg-eth1
cd $CWD

echo "we will restart system network, your connection is likely to get lost ..."
/etc/init.d/network restart
