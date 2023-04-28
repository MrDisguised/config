#!/bin/bash
timedatectl set-ntp true
lsblk
echo "Now parition time to partition your drives"
echo "Look at lsblk and tell me your drive names"
echo "What is your 1st drives 1st partition name ? Enter the full path name starting with /dev/xxxxxx"
read driveone
echo "What is your 1st drives 2nd partition name ? Enter the full path name starting with /dev/xxxxxx"
read drivetwo
sleep 7
read -p "Do you want to partition your drives? Answer in (yes/no/y/Y/N/n) " answer

case "$answer" in
  yes|y|Y|YES)
    
    echo "Opening cfdisk"
    sleep 3
    cfdisk $driveone
    
    sleep 3
    cfdisk $drivetwo
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

  
