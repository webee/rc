host=$(hostname)
case $host in
    darwin*)
        PY_HOME=/usr/local/bin;;
    arch*)
        PY_HOME=/usr/bin;;
    l-*)
        PY_HOME=/home/q/python/default/bin;;
    *)
        PY_HOME=/usr/bin
esac

export PY_HOME
