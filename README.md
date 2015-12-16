# mini-os-build-scripts

###Prerequisite
1. git://xenbits.xen.org/mini-os.git
2. http://download.savannah.gnu.org/releases/lwip/

###Xen on CentOS6
1. http://au1.mirror.crc.id.au/repo/el6/x86_64/ (Installation guide and RPM packages)
2. deploy a mini-os VM by invocation of "xl create mini-os.cfg"

###NOTE
1. lwIP misses sem_wait symbol definition, build failure !!!
