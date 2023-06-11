#!/bin/sh
echo "Cleaning firefox cache folders"
sleep 4
rm -rf /home/$(whoami)/.cache/mozilla/firefox/*.default-release/*
rm -rf /home/$(whoami)/.mozilla/firefox/*.default/*
rm -rf /home/$(whoami)/.cache/mozilla/firefox/*.default/*
rm -rf /home/$(whoami)/.mozilla/firefox/*.default-release/*
  
#echo "Running paccache"
#echo "Give your password"
#sleep 3
#sudo paccache -r
#echo "Now removing orphans"
#echo "Enter your root password"
#sudo pacman -Qtdq | sudo pacman -Rns -

