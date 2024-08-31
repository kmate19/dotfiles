#!/bin/bash

if [[ $XDG_CONFIG_HOME ]]; then
  ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
  ln -s ~/dotfiles/.zshrc ~/.zshrc
  ln -s ~/dotfiles/kitty.conf $XDG_CONFIG_HOME/kitty/kitty.conf
else
fi
