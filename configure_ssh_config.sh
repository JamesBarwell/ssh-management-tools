#!/bin/bash

set -e

if [ ! -z $1 ]; then
    # Read passed in filepath
    SSH_KEY=$(readlink -f $1)
else
    echo "You must specify a key"
    exit 1
fi

if [ ! -f "$SSH_KEY" ]; then
    echo "Could not find specified key"
    exit 1
fi

sed -i"" -e "/START ssh-management-auto-config/,/END ssh-management-auto-config/ { d; }" ~/.ssh/config
cat ./ssh_config | sed "s|{{ key }}|$SSH_KEY|" >> ~/.ssh/config
