host=$(hostname)
WORKON_HOME=~/.virtualenvs
case $host in
    darwin*)
        PY_HOME=/usr/local/bin;;
    arch*)
        PY_HOME=/usr/bin;;
    l-*)
        PY_HOME=/home/q/python/default/bin
        WORKON_HOME=/home/q/python/env
        ;;
    *)
        PY_HOME=/usr/bin;;
esac

export PY_HOME
export WORKON_HOME
