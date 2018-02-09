#!/bin/sh
STORED="";
while true
do
    if [ -f '/dbox/.dropbox-dist/VERSION' ]; then
        CUR="$(dropbox-cli status)";
        if [ "$STORED" != "$CUR" ]; then
            STORED="$CUR"
            echo "${STORED}"
        fi
    fi
    sleep 1
done
