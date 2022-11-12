#!/bin/bash

# clear out the gpg stuff if it exists
if [ -n "$GPG_KEY" ]; then
    # get the key from $GPG_KEY and parse the key into a file, every space is a new line
    echo "$GPG_KEY" | tr ' ' '\n' > ~/gpg_key.key
    # import the key
    gpg --import ~/gpg_key.key
    # delete the key file
    rm -rf ~/gpg_key.key
    
    # Fix for invalid ioctl device error
    GPG_TTY=$(tty)
    export GPG_TTY
    echo 'pinentry-mode loopback' >>~/.gnupg/gpg.conf
    
    if [ -n "$GPG_PASSWORD" ]; then
        # make session never expire and enter password once
        echo "default-cache-ttl 34560000" >~/.gnupg/gpg-agent.conf
        echo "max-cache-ttl 34560000" >~/.gnupg/gpg-agent.conf
        echo "test" | gpg --clearsign --default-key "$GPG_KEY_ID" --passphrase "$GPG_PASSWORD"
    fi
    
    # enable git commit signing
    git config --global user.signingkey "$GPG_KEY_ID"
    git config --global commit.gpgSign true
    
    git config --global user.email "frnoch@pm.me"
    git config --global user.email "lnxcz"
fi