#!/bin/sh
#set -x
cd $(dirname $0)
root=$(pwd)

this_host=$(hostname)
this_user=$(whoami)

while read host rc dest;
do
    if [ "$host" != "*" ] && [ "$host" != "$this_host" ]; then
        continue
    fi

    eval rc=$rc
    eval dest=$dest

    echo cp "$rc" "=>" "$dest"
    cp "$rc" "$dest"
done <./rcrc
