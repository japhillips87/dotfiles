#!/bin/zsh

chsh -s $(which zsh)

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
ln -s dotfiles/gemrc .gemrc
ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/gitignore .gitignore
ln -s dotfiles/irbrc .irbrc
ln -s dotfiles/rspec .rspec
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/zshrc .zshrc
ln -s dotfiles/zsh .zsh
ln -s dotfiles/git-prompt.sh .git-prompt.sh
ln -s dotfiles/aliases .aliases
