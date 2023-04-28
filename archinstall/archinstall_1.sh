#!/bin/bash
timedatectl set-ntp true
lsblk
echo "Now time to partition your drives"
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

read -p "Do you want btrfs ? If no then it will format the drive in ext4. Answer in (yes/no). Dont use caps (YES/NO). TYPE THE FULL WORD. DONT TYPE (y/n/Y/N)!!!!!" sex

case "$sex" in
  yes|y|Y|YES)
    mkfs.btrfs /dev/sda3
    ;;
  no|n|N|NO)
    mkfs.ext4 /dev/sda3
    ;;
  *)
    echo "Invalid input. Please run the script again "
    exit 1
    ;;
esac

mkswap /dev/sda2
mkfs.fat -F 32 /dev/sda1
mount --mkdir /dev/sda3 /mnt
mount --mkdir /dev/sda1 /mnt/boot
swapon /dev/sda2
pacman -Syyu reflector



pacstrap -K /mnt base linux-zen linux-firmware networkmanager vim nvim git reflector grub efibootmgr intel-ucode btrfs-progs e2fsprogs dosfstools exfatprogs exfat-utils terminus-font
genfstab -U /mnt >> /mnt/etc/fstab
echo "Now run the archinstall_2.sh script to complete rest of your installation"
echo "Goodbye :)"
arch-chroot /mnt
exit

  
