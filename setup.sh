#!/bin/bash

read -s pass

LANG=C xdg-user-dirs-gtk-update

echo $pass | sudo apt-get  install -y aptitude
echo $pass | sudo aptitude install -y gnome
echo $pass | sudo aptitude purge   -y unity gnome-session-flashback
echo $pass | sudo aptitude install -y xmonad xmobar suckless-tools
echo $pass | sudo aptitude install -y git tig
echo $pass | sudo aptitude install -y vim terminator

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

SCRIPT_DIR=$(dirname $0)

ln -sf $SCRIPT_DIR/.profile ~/.profile
ln -sf $SCRIPT_DIR/.Xmodmap ~/.Xmodmap
ln -sf $SCRIPT_DIR/.xmonad ~/.xmonad
ln -sf $SCRIPT_DIR/.vimrc ~/.vimrc
ln -sf $SCRIPT_DIR/.gitconfig ~/.gitconfig

