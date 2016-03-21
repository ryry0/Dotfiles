#!/bin/bash

sudo mount /dev/sda9 /mnt/arch

cd /mnt/arch

sudo mount -t proc proc proc/
sudo mount --rbind /sys sys/
sudo mount --rbind /dev dev/
sudo mount --rbind /run run/
sudo cp /etc/resolv.conf /mnt/arch/etc/resolv.conf

xhost +local:

sudo chroot /mnt/arch /bin/zsh -c exec su ryan
