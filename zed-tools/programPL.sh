#!/bin/bash
if [ ! -e /dev/xdevcfg ]; then
mknod /dev/xdevcfg c 259 0
fi
if [ ! -e"$1" ];
then echo "Use FPGA bitfile as argument"
exit 1
fi

cat "$1" > /dev/xdevcfg

result=$(cat /sys/devices/soc0/amba/f8007000.devcfg/prog_done)
if [ $result -ne 1 ]; 
then echo "ERROR configuring FPGA, logic is not configured!"
exit 1
fi
