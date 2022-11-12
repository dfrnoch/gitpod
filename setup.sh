#!/bin/bash

TMPDIR=$(mktemp -d)

CURRENT=$PWD

cd $TMPDIR

for script in ~/.dotfiles/scripts/*; do
    bash "$script"
done

# init starship
echo "eval \"\$(starship init bash)\"" >> ~/.bashrc

cd $CURRENT

rm -rf $TMPDIR
