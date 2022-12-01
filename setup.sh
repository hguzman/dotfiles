#!/bin/bash

echo "Linking up the dotfiles to your home directory ($HOME)"

mkdir ~/bin
cd ~/.dotfiles
stow vim
stow git
stow bin -t ~/bin
cd -

echo "DONE!"
