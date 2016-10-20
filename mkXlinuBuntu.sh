#!/bin/bash
wget http://cdimage.ubuntu.com/ubuntu/releases/16.04/release/ubuntu-16.04-preinstalled-server-armhf+raspi2.img.xz
unxz ubuntu-16.04-preinstalled-server-armhf+raspi2.img.xz
wget https://github.com/rlangoy/ZBLDBuilder/releases/download/xilinx-v2016.2/bootPartition.tar.gz
wget https://github.com/rlangoy/ZBLDBuilder/releases/download/xilinx-v2016.2/xilinxv2016.2-lib.tar.gz
mkdir boot
mkdir fs

sudo losetup /dev/loop2  ubuntu-16.04-preinstalled-server-armhf+raspi2.img
sudo kpartx -av /dev/loop2

sudo mount /dev/mapper/loop2p1 ./boot
sudo mount /dev/mapper/loop2p2 ./fs
sudo rm -rf boot/*
sudo tar xvzf bootPartition.tar.gz   --no-same-owner  -C ./boot

sudo rm -rf fs/lib/modules
sudo tar xvzf  xilinxv2016.2-lib.tar.gz -C ./fs 

sudo cp -r zed-tools fs/usr/share/zed-tools

#Clean up
sudo umount ./boot
sudo umount ./fs

sudo kpartx -d  /dev/loop2
sudo losetup -d /dev/loop2
sudo rm -rf boot
sudo rm -rf fs
mv  ubuntu-16.04-preinstalled-server-armhf+raspi2.img ubuntu-16.04-preinstalled-server-armhf+zedboard.img
xz ubuntu-16.04-preinstalled-server-armhf+zedboard.img

