#!/bin/bash
timedatectl set-ntp true
lsblk
echo "Now time to partition your drives"
echo "Look at lsblk and tell me your drive names"
echo "What is your main drives name ?"
read d1
echo "What is your 2nd drives name"
read d2
sleep 7
read -p "Do you want to partition your drives? Answer in (yes/no/y/Y/N/n) " answer

case "$answer" in
  yes|y|Y|YES)
    
    echo "Opening cfdisk"
    sleep 3
    cfdisk $d1
    
    sleep 3
    cfdisk $d2
    ;;
  no|n|N|NO)
    echo "Make up ur mind/fix ur shit and then run this script"
    exit 1
    ;;
  *)
    echo "Invalid input. Please run the script again "
    exit 1
    ;;
esac

echo "Okay now tell me the drive where you want to install EFI partition"
read d1p1

echo "Okay now tell me the drive where you want to install swap partition"
read d1p2

echo "Okay now tell me the drive where you want to install your operating system"
read d1p3

read -p "Do you want btrfs ? If no then it will format the drive in ext4. Answer in (yes/no). Dont use caps (YES/NO). TYPE THE FULL WORD. DONT TYPE (y/n/Y/N)!!!!!" sex

case "$sex" in
  yes|y|Y|YES)
    mkfs.btrfs $d1p3
    ;;
  no|n|N|NO)
    mkfs.ext4 $d1p3
    ;;
  *)
    echo "Invalid input. Please run the script again "
    exit 1
    ;;
esac

mkswap $d1p2
mkfs.fat -F 32 $d1p1
mount --mkdir $d1p3 /mnt
mount --mkdir $d1p1 /mnt/boot
swapon $d1p2
pacman -Syyu reflector



pacstrap -K /mnt base linux-zen linux-firmware networkmanager vim nvim git reflector grub efibootmgr intel-ucode btrfs-progs e2fsprogs dosfstools exfatprogs exfat-utils terminus-font
genfstab -U /mnt >> /mnt/etc/fstab
echo "Now run the archinstall_2.sh script to complete rest of your installation"
echo "Goodbye :)"
arch-chroot /mnt
exit

  
