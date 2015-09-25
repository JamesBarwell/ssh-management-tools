#!/bin/bash
set -e

COMMENT=$1

if [ -z "$COMMENT" ]; then
    echo "Please specify a comment for your keys"
    exit 1
fi

# ED25519 keys are favored over RSA keys when backward compatibility is not required.
# This is only compatible with OpenSSH 6.4+ and fixed-size (256 bytes).
ssh-keygen -t ed25519 -o -a 100 -C "$COMMENT $(date +%Y-%m-%d)"

# RSA keys are favored over ECDSA keys when backward compatibility is required
ssh-keygen -t rsa -b 4096 -C "$COMMENT $(date +%Y-%m-%d)"
