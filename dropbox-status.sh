#!/bin/sh
while true
do
    if [ -f '/dbox/.dropbox-dist/VERSION' ]; then
        dropbox-cli status
    fi
    sleep 10
done
