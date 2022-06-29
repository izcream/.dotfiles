#!/usr/bin/zsh

echo "starting setup dotfiles..."

#check if zsh is installed
if [ ! -x "$(command -v zsh)" ]; then
  echo "zsh is not installed"
  sudo apt install zsh
fi

#check if starship not installed
if [ ! -x "$(command -v starship)" ]; then
  echo "starship🚀 is not installed"
  # curl -sS https://starship.rs/install.sh | sh
fi

if [ -f "$HOME/.zshrc" ]; then
  echo "setup .zshrc config file"
  mv $HOME/.zshrc $HOME/.bak_zshrc
fi
if [ -f "$HOME/.config/starship.toml" ]; then
  rm -f $HOME/.config/starship.toml
fi

touch $HOME/.zshrc
echo "source ~/.dotfiles/zshrc" >>$HOME/.zshrc
ln -s $HOME/.dotfiles/starship.toml $HOME/.config/starship.toml
echo "setup finished"
