# mini-os-build-scripts

###Prerequisite
1. git://xenbits.xen.org/mini-os.git
2. http://download.savannah.gnu.org/releases/lwip/

###Xen on CentOS6
1. http://au1.mirror.crc.id.au/repo/el6/x86_64/ (Installation guide and RPM packages)
2. run apply-centos-6-config.sh to apply Xen-specific network configuration
3. deploy a mini-os VM by invocation of "xl create daytime-minios.cfg"

###Xen minios stubdom
1. see xen/stubdom/Makefile c-stubdom target, LDFLAGS does not contain --dynamic-linker, the output mini-os binary is statically linked executable
2. autoconf configure.ac > configure, here autoconf version must >= 2.67
3. how to link newlib.a, see stubdom/Makefile, TARGET_LDFLAGS

###NOTE
1. lwIP (v1.4.1) misses sem_wait symbol definition, build failure !!!
2. daytime server, telnet (port 13) does not work while ping is OK !!! lwip tcp_input would verify tcp header checksum, but netrfront/netback would not calculate/verify checksum, this causes lwip all tcp packets dropped.
3. tprintk cannot be used inside evtchn (pv irq) handler because this function access 'current' variable
4. newlib does not have stddef.h and stdarg.h, they are supplied by gcc, we have to add '-isystem /usr/lib/gcc/<arch>/<version>/include' to compile options if we compile programs with newlib
