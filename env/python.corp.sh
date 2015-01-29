function pathmunge {
    if echo $PATH | egrep -q "(^|:)$1($|:)";then
        a=${1//\//\\\/}
        PATH=$(echo $PATH|sed -e "s/\([:^]*\)$a\([$:]*\)/\1\2/g")
        PATH=$(echo $PATH|sed -e 's/::/:/g'|sed -e 's/^://g'|sed -e 's/:$//g')
    fi
    if [ "$2" = "after" ];then
        PATH=$PATH:$1
    else
        PATH=$1:$PATH
    fi
    export PATH
}

PY_HOME=/home/q/python/default/bin
#WORKON_HOME=/home/q/python/env

export PY_HOME
#export WORKON_HOME

export VIRTUALENVWRAPPER_PYTHON=${PY_HOME}/python

export PYENV_ROOT="/home/q/python/pyenv"
pathmunge "$PYENV_ROOT/bin"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
