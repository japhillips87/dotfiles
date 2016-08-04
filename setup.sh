#!/bin/bash

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
