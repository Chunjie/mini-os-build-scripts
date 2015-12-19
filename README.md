# mini-os-build-scripts

###Prerequisite
1. git://xenbits.xen.org/mini-os.git
2. http://download.savannah.gnu.org/releases/lwip/

###Xen on CentOS6
1. http://au1.mirror.crc.id.au/repo/el6/x86_64/ (Installation guide and RPM packages)
2. run apply-centos-6-config.sh to apply Xen-specific network configuration
3. deploy a mini-os VM by invocation of "xl create mini-os.cfg"

###NOTE
1. lwIP (v1.4.1) misses sem_wait symbol definition, build failure !!!
