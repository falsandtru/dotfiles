#!/bin/bash

LANG=C xdg-user-dirs-gtk-update

sudo apt-get  install -y aptitude
sudo aptitude install -y gnome-shell gnome-tweak-tool gnomw-shell-extensions
sudo aptitude purge   -y unity ubuntu-desktop gnome-games
#sudo aptitude install -y xmonad xmobar suckless-tools
sudo aptitude install -y git tig

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

SCRIPT_DIR=$(dirname $0)

ln -sf $SCRIPT_DIR/.profile ~/.profile
ln -sf $SCRIPT_DIR/.Xmodmap ~/.Xmodmap
ln -sf $SCRIPT_DIR/.xmonad ~/.xmonad
ln -sf $SCRIPT_DIR/.vimrc ~/.vimrc
ln -sf $SCRIPT_DIR/.gitconfig ~/.gitconfig

