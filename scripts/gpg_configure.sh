#!/bin/bash

if [ -n "$GPG_KEY" ]; then
    #hacky way to import the key
    echo $GPG_KEY | sed -e 's/-----BEGIN PGP PRIVATE KEY BLOCK-----//g' -e 's/-----END PGP PRIVATE KEY BLOCK-----//g' | tr ' ' '\n' > gpg.key
    echo "-----END PGP PRIVATE KEY BLOCK-----" >> gpg.key
    sed -i '/^$/d' gpg.key
    sed -i '1s/^/-----BEGIN PGP PRIVATE KEY BLOCK-----\n\n/' gpg.key
    
    # import the key
    gpg --batch --import ~/gpgy.key
    # delete the key file
    rm -rf ~/gpg.key
    
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
    
fi