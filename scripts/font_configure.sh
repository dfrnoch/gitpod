#!/bin/bash

#FONTS
mkdir fira-code
cd fira-code
curl https://github.com/tonsky/FiraCode/releases/download/5.2/Fira_Code_v5.2.zip -o fira-code.zip -s -L
unzip fira-code.zip
cp ttf/*.ttf ~/
cd ..
rm -rf fira-code

# Install regular Fira font (OTF version)
git clone https://github.com/mozilla/Fira.git --depth=1
cp Fira/otf/*.otf ~/
rm -rf Fira