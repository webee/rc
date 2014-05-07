#!/bin/bash
#set -x
set -e
cd $(dirname $0)
root=$(pwd)

this_host=$(hostname)
if [ "${this_host}" = "localhost" ]; then
    this_host=$(uname)
fi
this_user=$(whoami)

while read host rc dest after;
do
    # ignore empty line and comment(^#).
    if [ "$host" = "" ] || [[ "$host" =~ '^#' ]]; then
        continue
    fi

    if [[ "$host" == !* ]]; then
        if [[ "$this_host" == ${host:1} ]]; then
            continue
        fi
    else
        if ! [[ "$this_host" == $host ]]; then
            continue
        fi
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
