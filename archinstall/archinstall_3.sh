#!/bin/sh
useradd -m rounak
echo "NOW GIVE THE PASSWORD FOR UR NEW USER. BE VERY CAREFULL AND REMEMBER THE PASSWORD!!!!"
sleep 7
passwd rounak
usermod -aG root,wheel,audio,disk,input,kvm,optical,storage,video,libvirt,gamemode,realtime,rounak rounak
pacman -S sudo
