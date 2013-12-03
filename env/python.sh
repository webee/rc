host=$(hostname)
WORKON_HOME=~/.virtualenvs
case $host in
    darwin*)
        PY_HOME=/usr/local/bin;;
    arch*)
        PY_HOME=/usr/bin;;
    *)
        PY_HOME=/usr/bin;;
esac

export PY_HOME
export WORKON_HOME
