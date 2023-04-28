#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc
echo "Now time to edit your locale. Vim will open /etc/locale.gen and uncomment the ``en_US.UTF-8 UTF-8`` and ``en_IN UTF-8`` locale."
sleep 14
vim /etc/locale.gen
echo "LANG=en_IN.UTF-8" >> /etc/locale.conf
echo "LC_TIME=en_IN.UTF-8" >> /etc/locale.conf
echo "archissexy" >> /etc/hostname
systemctl enable NetworkManager.service
echo "Now it is time TO SET YOUR ROOT PASSWORD BE VERY CAREFULL AND REMEMBER THE PASSWORD." 
sleep 6
passwd
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
sleep 5
grub-mkconfig -o /boot/grub/grub.cfg
sleep 2
echo "ALL DONE!!!! LEZZZ GOOOOO BOIIISSS"

