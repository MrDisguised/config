#!/bin/bash
timedatectl set-ntp true
lsblk
echo "Now time to partition your drives"
echo "Look at lsblk and tell me your drive names"
echo "What is your main drives name ? Mention the full name starting with /dev"
read d1
echo "What is your 2nd drives name? Mention the full name starting with /dev"
read d2
sleep 7
read -p "Do you want to partition your drives? Answer in (yes/no/y/Y/N/n/YES/NO) " answer

case "$answer" in
  yes|y|Y|YES)
    
    echo "Opening cfdisk"
    echo "Now format your first drive"
    sleep 3
    cfdisk $d1
    echo "Now format your second drive"
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

lsblk

echo "Okay now tell me the drive partition number where you want to install EFI partition. Mention the full partition name starting with /dev/sdax etc etc"
read d1p1

echo "Okay now tell me the drive partition number where you want to install swap partition. Mention the full partition name starting with /dev/sdax etc etc"
read d1p2

echo "Okay now tell me the drive partition number where you want to install your operating system. Mention the full partition name starting with /dev/sdax etc etc"
read d1p3

echo "Okay now tell me the second drives (/dev/sdb) partition number where you want to install your operating system. Mention the full partition name starting with /dev/sdax etc etc"
read d2p1

read -p "Do you want to format your root partition in btrfs ? If no then it will format the drive in ext4. Answer in (yes/no/y/Y/N/n/YES/NO)" sex

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

read -p "Do you want to format your second drive (/dev/sdb) in btrfs ? If no then it will format the drive in ext4. Answer in (yes/no/y/Y/N/n/YES/NO)" bruh

case "$bruh" in
  yes|y|Y|YES)
    mkfs.btrfs $d2p1
    ;;
  no|n|N|NO)
    mkfs.ext4 $d2p1
    ;;
  *)
    echo "Invalid input. Please run the script again "
    exit 1
    ;;
esac

mkdir /media && mount --mkdir $d2p1 /media/data
mkswap $d1p2
mkfs.fat -F 32 $d1p1
mount --mkdir $d1p3 /mnt
mount --mkdir $d1p1 /mnt/boot
swapon $d1p2
pacman -Syyu reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector --country India --sort score --latest 20 --fastest 20 --save /etc/pacman.d/mirrorlist
pacstrap -K /mnt base linux-zen linux-firmware networkmanager vim micro neovim git zip unzip p7zip wget reflector grub efibootmgr intel-ucode btrfs-progs e2fsprogs dosfstools exfatprogs exfat-utils terminus-font
genfstab -U /mnt >> /mnt/etc/fstab
echo "Now run the archinstall_2.sh script to complete rest of your installation"
echo "Goodbye :)"
arch-chroot /mnt


  
