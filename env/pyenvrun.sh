#!/bin/sh
#require: virtualenv, virtualenvwrapper
#set -x
#set -e

function set_py_home() {
    # if already set.
    if [ "$PY_HOME" != "" ]; then
        return
    fi

    # find from global python profile.
    if [ -f /etc/profile.d/python.sh ]; then
        source /etc/profile.d/python.sh
        if [ "$PY_HOME" != "" ]; then
            return
        fi
    fi

    # suppose this script is together with python
    if [ -x "$(dirname $0)/python" ]; then
        export PY_HOME=$(dirname $0)
        return
    fi

    # suppose current python is right.
    if hash python >/dev/null 2>&1; then
        if [ -f "$(dirname $(which python))/virtualenvwraper.sh" ]; then
            export PY_HOME=$(dirname $(which python))
            return
        fi
    fi
    echo "can't set PY_HOME" 1>&2
    exit 123
}

set_py_home
export VIRTUALENVWRAPPER_PYTHON=${PY_HOME}/python
source ${PY_HOME}/virtualenvwrapper.sh
export WORKON_HOME=~/.virtualenvs

if [ "$1" != "" ]; then
    if workon $1 >/dev/null 2>&1; then
        shift
    fi
fi

python $@
