#!/bin/bash

sudo yum install -y git tig

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

ln -sf $SCRIPT_DIR/.profile ~/.profile
ln -sf $SCRIPT_DIR/.Xmodmap ~/.Xmodmap
ln -sf $SCRIPT_DIR/.xmonad ~/.xmonad
ln -sf $SCRIPT_DIR/.vimrc ~/.vimrc
ln -sf $SCRIPT_DIR/.gitconfig ~/.gitconfig

