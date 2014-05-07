host=$(hostname)
if [ "${host}" = "localhost" ]; then
    host=$(uname)
fi
WORKON_HOME=~/.virtualenvs
case $host in
    darwin*|Darwin*)
        PY_HOME=/usr/local/bin;;
    arch*)
        PY_HOME=/usr/bin;;
    *)
        PY_HOME=/usr/bin;;
esac

export PY_HOME
export WORKON_HOME

export VIRTUALENVWRAPPER_PYTHON=${PY_HOME}/python
