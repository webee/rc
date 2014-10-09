#!/bin/bash
if [ "$1" == '.' ];then
    shift;
    exec tmux $*
    exit 0
fi

name=$1
n=$2
if [ "$name" == "" ];then
    name="work"
fi

if tmux ls|grep -q "^$name";then
    tmux attach-session -t $name
    exit 0
fi

if [ "$n" == "" ];then
    n=4
fi

tmux new-session -s $name -d
while [ $n -gt 1 ];do
    tmux neww -t $name
    n=$[$n-1]
done

tmux next-window -t $name
tmux attach-session -t $name
