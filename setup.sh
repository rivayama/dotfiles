#!/bin/sh

cd ~/dotfiles
for f in .?*
do
  if [ $f != '..' ] && [ $f != '.git' ] && [ $f != '.gitmodules' ] && [ $f != '.gitignore' ]
  then
    ln -Ffs "$PWD/$f" $HOME
  fi
done

git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/.vim/bundle/neobundle.vim
vim +NeoBundleInstall +qall
