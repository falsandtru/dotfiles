#!/bin/bash

LANG=C xdg-user-dirs-gtk-update

apt-get   install -y aptitude
aptitude  install -y gnome
aptitude  purge   -y unity
aptitude  install -y xmonad xmobar suckless-tools
aptitude  install -y git tig
aptitude  install -y vim terminator

SCRIPT_DIR=$(dirname $0)

ln -sf $SCRIPT_DIR/.profile ~/.profile
ln -sf $SCRIPT_DIR/.Xmodmap ~/.Xmodmap
ln -sf $SCRIPT_DIR/.xmonad ~/.xmonad
ln -sf $SCRIPT_DIR/.vimrc ~/.vimrc
ln -sf $SCRIPT_DIR/.gitconfig ~/.gitconfig

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

