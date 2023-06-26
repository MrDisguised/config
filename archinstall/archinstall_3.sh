#!/bin/sh
useradd -m rounak
echo "NOW GIVE THE PASSWORD FOR UR NEW USER. BE VERY CAREFULL AND REMEMBER THE PASSWORD!!!!"
sleep 7
passwd rounak
usermod -aG wheel,audio,disk,input,kvm,optical,storage,video,libvirt,realtime,rounak rounak
pacman -S sudo polkit
echo "NOW YOU ARE GOING TO EDIT TO SUDOERS FILE. BE VERY CAREFULL!!!! MAKE SURE TO UNCOMMENT THE '%wheel      ALL=(ALL:ALL) ALL' LINE."
sleep 12
EDITOR=vim visudo
echo "ALL DONE :) !! NOW REBOOT YOUR SYSTEM AND RUN THE 'archinstall_4.sh' script"

