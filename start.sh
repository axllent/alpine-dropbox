#!/bin/sh

if [ ! -d ~/.dropbox-dist ]; then
    echo "Dropbox client not found, downloading... please wait..."
    wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    echo "Installed Dropbox version:" $(cat /dbox/.dropbox-dist/VERSION)
fi

# Script to log the dropbox status every second (if changed)
dropbox-status &

~/.dropbox-dist/dropboxd
