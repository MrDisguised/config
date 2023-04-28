#!/bin/sh
killall -q firefox
rm -rf /home/$(whoami)/.mozilla/firefox/*.default-release/*
rm -rf /home/$(whoami)/.cache/mozilla/firefox/*.default-release/*
rm -rf /home/$(whoami)/.mozilla/firefox/*.default/*
rm -rf /home/$(whoami)/.cache/mozilla/firefox/*.default/*
cd ~/Desktop && git clone https://github.com/arkenfox/user.js && cd user.js
cp -r * /home/$(whoami)/.mozilla/firefox/*.default-release/
curl https://raw.githubusercontent.com/MrDisguised/config/main/arkenfox_firefox/user-overrides.txt > /home/$(whoami)/.mozilla/firefox/*.default-release/user-overrides.js
curl https://raw.githubusercontent.com/arkenfox/user.js/master/scratchpad-scripts/arkenfox-cleanup.js | wl-copy
firefox about:config
/home/$(whoami)/.mozilla/firefox/*.default-release/updater.sh
/home/$(whoami)/.mozilla/firefox/*.default-release/prefsCleaner.sh
rm -rf ~/Desktop/user.js
echo "All good :)"

