#!/bin/sh
if [ -n "$(ps aux|grep 'ssh -D7070'|grep -v grep)" ];then 
    exit 0
fi
ssh -D7070 -N li-arch64v_01
