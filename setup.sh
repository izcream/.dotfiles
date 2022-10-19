#!/usr/bin/bash

echo "starting setup dotfiles..."

DOTFILE_PATH=$HOME/.dotfiles
CONFIG_PATH=$HOME/.config

#check if zsh is installed
if [ ! -x "$(command -v zsh)" ]; then
  echo "zsh is not installed"
  apt update && apt install -y zsh
fi
#check curl
if [ ! -x "$(command -v curl)" ]; then
  apt install -y curl
fi

#check if starship not installed
if [ ! -x "$(command -v starship)" ]; then
  echo "starship🚀 is not installed"
  curl -sS https://starship.rs/install.sh | sh
fi

#check bat
if [ ! -x "$(command -v bat)" ]; then
  echo "bat is not installed"
  apt install bat -y
  ln -s /usr/bin/batcat ~/.local/bin/bat
fi


#check folder config exists
if [[ ! -d $CONFIG_PATH ]]; then
  echo "creating $CONFIG_PATH"
  mkdir -p $CONFIG_PATH
fi

#remove old zshrc
if [[ -f $HOME/.zshrc ]]; then
  if [[ -L $HOME/.zshrc ]]; then
    rm $HOME/.zshrc
  else
    mv $HOME/.zshrc $HOME/.zshrc_bak
  fi
fi

#check starship config
if [[ -f $CONFIG_PATH/starship.toml ]]; then
  if [[ -L $CONFIG_PATH/starship.toml ]]; then
    rm $CONFIG_PATH/starship.toml
  else
    mv $CONFIG_PATH/starship.toml $CONFIG_PATH/starship.toml_bak
  fi
fi

#bat
if [[ -d $CONFIG_PATH/bat ]]; then
  if [[ -L $CONFIG_PATH/bat ]]; then
    rm -rf $CONFIG_PATH/bat
  else
    mv $CONFIG_PATH/bat $CONFIG_PATH/bat_bak
  fi
fi

#lsd
if [[ -d $CONFIG_PATH/lsd ]]; then
  if [[ -L $CONFIG_PATH/lsd ]]; then
    rm -rf $CONFIG_PATH/lsd
  else
    mv $CONFIG_PATH/lsd $CONFIG_PATH/lsd_bak
  fi
fi

ln -s $DOTFILE_PATH/.zshrc $HOME/.zshrc
ln -s $DOTFILE_PATH/.config/starship.toml $HOME/.config/starship.toml
ln -s $DOTFILE_PATH/.config/bat $HOME/.config/bat
ln -s $DOTFILE_PATH/.config/lsd $HOME/.config/lsd
echo "setup finished"
