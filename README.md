# Ubuntu-16.04-Zedboard
Ubuntu 16.04 image for Zedboard Script
First time you run this image on the zedbaord you might need to:
Configure U-Boot
After applying power, the micro-USB cable will create a serial device on your computer as /dev/ttyACM0. Connect to this using 115200n8.
Press any key to stop autoboot and get to the U-Boot command prompt.
Save variables that will be replaced:
setenv sdboot_orig $sdboot
Set the new variables:
setenv bootargs 'console=ttyPS0,115200 root=/dev/mmcblk0p2 rw rootwait'
setenv sdboot 'echo Copying Linux from SD to RAM... && mmcinfo && fatload mmc 0 0x3000000 ${kernel_image} && fatload mmc 0 0x2A00000 ${devicetree_image} && bootm 0x3000000 - 0x2A00000'
Save the new configuration:
saveenv
Boot the system by typing boot.
Login as the default user alarm with the password alarm.
The default root password is root.
