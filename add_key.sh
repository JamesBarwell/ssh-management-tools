#!/bin/bash

set -e

NEW_KEY_PATH=$1

if [ ! -f "$NEW_KEY_PATH" ]; then
    echo "Please specify the path to the public key file you wish to add"
    exit 1
fi

dir=$(dirname "$(readlink -f "$0")")
CMD="tee -a ~/.ssh/authorized_keys"

while read host; do
    echo "Adding key to: $host"
    ssh root@$host $CMD <<< $(cat $NEW_KEY_PATH)
done < hosts
