#!/bin/sh
#set -x
set -e
cd $(dirname $0)
root=$(pwd)

this_host=$(hostname)
this_user=$(whoami)

while read host rc dest after;
do
    if [ "$host" != "*" ] && [ "$host" != "$this_host" ]; then
        continue
    fi

    eval rc=$rc
    eval dest=$dest

    echo cp "$rc" "=>" "$dest"
    if ! cp "$rc" "$dest" >/dev/null 2>&1; then
        sudo cp "$rc" "$dest"
    fi

    if [ "$after" != "" ]; then
        echo run "$after"
        $after
    fi
done <./rcrc
