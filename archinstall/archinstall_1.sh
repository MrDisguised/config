#!/bin/bash
timedatectl set-ntp true
echo Now parition your drives sda and sdb
sda1 - 512M - Will be mounted on /boot
sda2 - 4G - Will be a [SWAP] partition
sda3 - Rest - Will be mounted on /mnt
sleep 7
read -p "Do you want to partition your drives? Answer in (yes/no). Type the full word (yes/no). DON'T TYPE (Y/N) " answer

if [ "$answer" = "yes" ]; then
  echo "First edit your sda drive"
  echo "Opening cfdisk"
  sleep 3
  cfdisk /dev/sda
  echo "Now edit your sdb drive"
  echo "Opening cfdisk"
  sleep 3
  cfdisk /dev/sdb
else
  curl https://raw.githubusercontent.com/MrDisguised/config/main/archinstall/archinstall_2.sh | bash
fi

curl https://raw.githubusercontent.com/MrDisguised/config/main/archinstall/archinstall_2.sh | bash

  
