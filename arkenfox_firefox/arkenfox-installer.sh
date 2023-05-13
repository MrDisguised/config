#!/bin/sh
killall -q firefox
rm -rf /home/$(whoami)/.mozilla/firefox/*.default-release/*.*
rm -rf /home/$(whoami)/.cache/mozilla/firefox/*.default-release/*.*
rm -rf /home/$(whoami)/.mozilla/firefox/*.default/*.*
rm -rf /home/$(whoami)/.cache/mozilla/firefox/*.default/*.*
cd ~/Desktop && git clone https://github.com/arkenfox/user.js && cd user.js
cp -r *.* /home/$(whoami)/.mozilla/firefox/*.default-release/.
cd /home/$(whoami)/.mozilla/firefox/*.default-release/ && curl https://raw.githubusercontent.com/MrDisguised/config/main/arkenfox_firefox/user-overrides.txt > user-overrides.js
curl https://raw.githubusercontent.com/arkenfox/user.js/master/scratchpad-scripts/arkenfox-cleanup.js | wl-copy
echo "NOW THIS BASH SCRIPT WILL OPEN FIREFOX. STUFF HAS BEEN ALREADY COPIED TO UR CLIPBOARD"
echo "DO CTRL + SHIFT + K AND IT WILL OPEN THE CONSOLE. TYPE allow pasting TO ALLOW PASTING AND PASTE THE STUFF INSIDE WHICH HAS BEEN COPIED TO YOUR CLIPBOARD BY THIS BASH SCRIPT"
sleep 8
firefox about:config
cd /home/$(whoami)/.mozilla/firefox/*.default-release/ && ./updater.sh
cd /home/$(whoami)/.mozilla/firefox/*.default-release/ && ./prefsCleaner.sh
rm -rf ~/Desktop/user.js
echo "All good :)"

