# Ubuntu-16.04-Zedboard
Ubuntu 16.04 image for Zedboard Script <br>
First time you run this image on the zedbaord you might need to: <br>
Configure U-Boot <br>
After applying power, the micro-USB cable will create a serial device on your computer as /dev/ttyACM0. Connect to this using 115200n8. <br>
Press any key to stop autoboot and get to the U-Boot command prompt. <br>
Save variables that will be replaced: <br>
setenv sdboot_orig $sdboot <br>
Set the new variables: <br>
setenv bootargs 'console=ttyPS0,115200 root=/dev/mmcblk0p2 rw rootwait' <br>
setenv sdboot 'echo Copying Linux from SD to RAM... && mmcinfo && fatload mmc 0 0x3000000 ${kernel_image} && fatload mmc 0 0x2A00000 ${devicetree_image} && bootm 0x3000000 - 0x2A00000' <br>
Save the new configuration: <br>
saveenv <br>
Boot the system by typing boot. <br>
Login as the default user alarm with the password alarm. <br>
The default root password is root. <br>
