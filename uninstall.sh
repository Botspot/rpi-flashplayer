#!/bin/bash

function error {
  echo -e "\e[91m$1\e[39m"
  exit 1
}

echo "Reverting Chromium to latest version..."
bash <(wget -qO- https://raw.githubusercontent.com/Botspot/pi-apps/master/apps/Downgrade%20Chromium/uninstall) || error "Failed to uninstall Chromium v78!"

sudo rm -f /etc/chromium-browser/customizations/01-enable-adobe-flash

if [ -f /usr/bin/scratch2 ];then
  echo "
Skipping removal of libpepflashplayer.so because scratch2 is installed.
Run this command to remove the file:
sudo rm /usr/lib/chromium-browser/libpepflashplayer.so
"
  
else
  sudo rm -f /usr/lib/chromium-browser/libpepflashplayer.so
fi

