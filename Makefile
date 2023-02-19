# SPDX-License-Identifier: GPL-2.0
# mpt3sas makefile
# obj-$(CONFIG_SCSI_MPT3SAS) += mpt3sas.o
# mpt3sas-y +=  mpt3sas_base.o     \
# 		mpt3sas_config.o \
# 		mpt3sas_scsih.o      \
# 		mpt3sas_transport.o     \
# 		mpt3sas_ctl.o	\
# 		mpt3sas_trigger_diag.o \
# 		mpt3sas_warpdrive.o \
# 		mpt3sas_debugfs.o \

#obj-$(CONFIG_LEAPIO_SAS) := leapsas.o
#leapsas-y := leapiosas.o leapiosas_init.o

ifneq  ($(KERNELRELEASE),)
	obj-m += mpt3sas_1.o
	mpt3sas_1-objs := mpt3sas_base.o mpt3sas_config.o mpt3sas_scsih.o mpt3sas_transport.o
else
	KERNEL_DIR = /lib/modules/$(shell uname -r)/build
endif

all:
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) modules

ddtest:
	sudo dd if=/dev/sda of=/dev/sda bs=1M count=1024

install:
#	sudo modprobe mpt3sas_1
	sudo insmod mpt3sas_1.ko

uninstall:
	sudo rmmod mpt3sas_1

.PHONY:clean
clean:
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) clean
