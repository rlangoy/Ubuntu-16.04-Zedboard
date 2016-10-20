#!/bin/bash
echo "++ Exporting leds "
for i in 0 1 2 3 4 5 6 7;
do led=$(($i+979));
echo $led > /sys/class/gpio/export;
echo out > /sys/class/gpio/gpio$led/direction;
echo 1 > /sys/class/gpio/gpio$led/value;
echo $led > /sys/class/gpio/unexport;
done;

