read -p "Do you want btrfs ? If no then it will format the drive in ext4. Answer in (yes/no) . TYPE THE FULL WORD. DONT TYPE (y/n/Y/N)!!!!!" sex
if [ "$sex" = "btrfs" ]; then
  mkfs.btrfs /dev/sda3
else
  mkfs.ext4 /dev/sda3

mkswap /dev/sda2
mkfs.fat -F 32 /dev/sda1
mount --mkdir /dev/sda3 /mnt
mount --mkdir /dev/sda1 /mnt/boot
swapon /dev/sda2
