#! /bin/bash

sudo modprobe vboxdrv
sudo modprobe vboxnetadp
sudo modprobe vboxnetflt
sudo modprobe vboxpci

sudo mkswap /dev/sda8
sudo swapon /dev/sda8

vboxmanage startvm QNX
