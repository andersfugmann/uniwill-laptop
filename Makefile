CFLAGS_uniwill-laptop.o := -DDEBUG
obj-m += uniwill-laptop.o
uniwill-laptop-y := uniwill-acpi.o uniwill-wmi.o

all:
	make -C /lib/modules/`uname -r`/build M=`pwd` modules

clean:
	make -C /lib/modules/`uname -r`/build M=`pwd` clean

dkms:
	sudo dkms remove uniwill-laptop/0.9
	sudo dkms install .

load: all
	sudo rmmod uniwill_laptop || true
	#sudo rmmod uniwill_wmi || true
	#sudo rmmod uniwill_acpi || true
	sudo insmod ./uniwill-laptop.ko
