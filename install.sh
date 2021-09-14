#!/bin/bash

function error {
  echo -e "\e[91m$1\e[39m"
  exit 1
}

echo "Installing Chromium v78..."
bash <(wget -qO- https://raw.githubusercontent.com/Botspot/pi-apps/master/apps/Downgrade%20Chromium/install-32) 78 || error "Failed to install Chromium v78!"

sudo wget -O /usr/lib/chromium-browser/libpepflashplayer.so https://github.com/Botspot/rpi-flashplayer/raw/main/libpepflashplayer.so || error "Failed to download libpepflashplayer.so to /usr/lib/chromium-browser"

echo 'CHROMIUM_FLAGS="${CHROMIUM_FLAGS} --ppapi-flash-path=/usr/lib/chromium-browser/libpepflashplayer.so --ppapi-flash-args=enable_stagevideo_auto=0 --ppapi-flash-version=32.0.0.330"' | sudo tee /etc/chromium-browser/customizations/01-enable-adobe-flash >/dev/null || error "Failed to create file /etc/chromium-browser/customizations/01-enable-adobe-flash"


