#DEBUG_FLAG = -DDEBUG
CFLAGS_uniwill-laptop.o := $(DEBUG_FLAG)
CFLAGS_uniwill-wmi.o := $(DEBUG_FLAG)
obj-m += uniwill-laptop.o
obj-m += uniwill-wmi.o

all:
	make -C /lib/modules/`uname -r`/build M=`pwd` modules

clean:
	make -C /lib/modules/`uname -r`/build M=`pwd` clean

dkms:
	sudo dkms remove uniwill-laptop/0.9
	sudo dkms install .

load: all
	sudo rmmod uniwill_laptop || true
	sudo rmmod uniwill_wmi || true
	sudo insmod ./uniwill-wmi.ko
	sudo insmod ./uniwill-laptop.ko
