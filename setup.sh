#!/bin/bash

echo "Installing ag"

if ! [ -x "$(command -v ag)" ]; then
  cd /tmp
  sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
  git clone https://github.com/ggreer/the_silver_searcher
  cd the_silver_searcher
  ./build.sh
  sudo make install
  rm -rf /tmp/the_silver_searcher
fi

cd
echo "Generating Symlinks"

ln -s dotfiles/vim .vim
ln -s dotfiles/bash_aliases .bash_aliases
ln -s dotfiles/bash_completion .bash_completion
ln -s dotfiles/bash_login .bash_login
ln -s dotfiles/bash_profile .bash_profile
ln -s dotfiles/bashrc .bashrc
ln -s dotfiles/gemrc .gemrc
ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/gitignore .gitignore
ln -s dotfiles/gvimrc .gvimrc
ln -s dotfiles/irbrc .irbrc
ln -s dotfiles/rspec .rspec
ln -s dotfiles/rvmrc .rvmrc
ln -s dotfiles/screenrc .screenrc
ln -s dotfiles/tmux.conf .tmux.conf
ln -s dotfiles/tmuxinator .tmuxinator
ln -s dotfiles/vimrc .vimrc

echo "Cloning Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing VIM Plugins"
vim +PluginInstall +qall

