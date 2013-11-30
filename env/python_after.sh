#!/bin/bash
#set -x
set -e

root=$(dirname $0)

source /etc/profile.d/python.sh
if ! cp $root/pyenvrun.sh ${PY_HOME}/pyenvrun >/dev/null 2>&1; then
    cp $root/pyenvrun.sh ${PY_HOME}/pyenvrun
fi
