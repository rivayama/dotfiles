#!/bin/sh
cd $(dirname $0)
for dotfile in .?*
do
  if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.gitmodules' ] && [ $dotfile != '.gitignore' ]
  then
    ln -Ffs "$PWD/$dotfile" $HOME
  fi
done

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim  +BundleInstall +q
