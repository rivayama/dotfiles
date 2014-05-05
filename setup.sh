#!/bin/sh

cd ~/dotfiles
for f in .?*
do
  if [ $f != '..' ] && [ $f != '.git' ] && [ $f != '.gitmodules' ] && [ $f != '.gitignore' ]
  then
    ln -Ffs "$PWD/$f" $HOME
  fi
done

git clone https://github.com/gmarik/vundle.git ~/dotfiles/.vim/bundle/vundle
vim +BundleInstall +q +q
