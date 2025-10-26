#DEBUG_FLAG = -DDEBUG
CFLAGS_uniwill-laptop.o := $(DEBUG_FLAG)
CFLAGS_uniwill-wmi.o := $(DEBUG_FLAG)
obj-m += uniwill-laptop.o
obj-m += uniwill-wmi.o

all:
	make -C /lib/modules/`uname -r`/build M=`pwd` modules

clean:
	make -C /lib/modules/`uname -r`/build M=`pwd` clean
