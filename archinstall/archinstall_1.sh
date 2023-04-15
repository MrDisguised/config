timedatectl
timedatectl set-ntp true
echo Now parition your drive - sda
sda1 - 512M - Will be mounted on /boot
sda2 - 4G - Will be a [SWAP] partition
sda3 - Rest - Will be mounted on /mnt
read -p "Do you want to partition your drives? Answer in (yes/no)" answer
