#!/bin/bash
timedatectl set-ntp true
echo "Now parition your drives sda and sdb"
echo "sda1 - 512M - Will be mounted on /boot"
echo "sda2 - 4G - Will be a [SWAP] partition"
echo "sda3 - Rest - Will be mounted on /mnt"
sleep 7
read -p "Do you want to partition your drives? Answer in (yes/no/y/Y/N/n) " answer

case "$answer" in
  yes|y|Y|YES)
    echo "First edit your sda drive"
    echo "Opening cfdisk"
    sleep 3
    cfdisk /dev/sda
    echo "Now edit your sdb drive"
    sleep 3
    cfdisk /dev/sdb
    ;;
  no|n|N|NO)
    echo "Make up ur mind/ fix ur shit and then run this script"
    exit 1
    ;;
  *)
    echo "Invalid input. Please run the script again "
    exit 1
    ;;
esac

curl https://raw.githubusercontent.com/MrDisguised/config/main/archinstall/archinstall_2.sh | bash

  
