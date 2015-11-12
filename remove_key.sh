#!/bin/bash

# This script will search the list of keys for the specified match string, and remove any lines containing it. Therefore please ensure that you provide enough of a match that you do not remove any false positives.

set -e

identifier=$1

if [ ${#identifier} -le 4 ]; then
    echo "The match string has less than 5 characters, so I am too scared to just go and remove it. Please specify more characters so that we can be sure we do not get false positive matches."
    exit 1
fi

dir=$(dirname "$(readlink -f "$0")")
CMD="sed -i '/"$identifier"/d' ~/.ssh/authorized_keys"

while read host; do
    echo "Removing key from: $host"
    ssh root@$host $CMD
done < hosts
