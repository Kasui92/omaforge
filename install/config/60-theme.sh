#!/bin/bash

# Setup theme links
if [ -d ~/.config/omaforge/themes ]; then
  rm -rf ~/.config/omaforge/themes
fi
mkdir -p ~/.config/omaforge/themes
for f in ~/.local/share/omaforge/themes/*; do ln -s "$f" ~/.config/omaforge/themes/; done

# Set initial theme
mkdir -p ~/.config/omaforge/current
ln -snf ~/.config/omaforge/themes/tokyo-night ~/.config/omaforge/current/theme
ln -snf $(find "$HOME/.config/omaforge/current/theme/backgrounds/" -type f | head -n 1) "$HOME/.config/omaforge/current/background"

# Set specific app links for current theme
ln -snf ~/.config/omaforge/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/omaforge/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/forge/stylesheet/forge
ln -snf ~/.config/omaforge/current/theme/forge.css ~/.config/forge/stylesheet/forge/stylesheet.css


