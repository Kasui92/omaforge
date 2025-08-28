#!/bin/bash

# Copy over Omaforge configs
mkdir -p ~/.config
cp -R ~/.local/share/omaforge/config/* ~/.config/

# Configure the bash shell using Omaforge defaults
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/omaforge/default/bashrc ~/.bashrc

# Ensure application directory exists for update-desktop-database
mkdir -p ~/.local/share/applications

# If bare install, allow a way for its exclusions to not get added in updates
if [ -n "$OMAFORGE_BARE" ]; then
  mkdir -p ~/.local/state/omaforge
  touch ~/.local/state/omaforge/bare.mode
fi

# Load the PATH for use later in the installers
source ~/.local/share/omaforge/default/bash/shell

# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true

# Set identification from install inputs
if [[ -n "${OMAFORGE_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$OMAFORGE_USER_NAME"
fi

if [[ -n "${OMAFORGE_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$OMAFORGE_USER_EMAIL"
fi

# Set XCompose
if [ -f ~/.XCompose ]; then
  rm ~/.XCompose
fi

tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/omaforge/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$OMAFORGE_USER_NAME"
<Multi_key> <space> <e> : "$OMAFORGE_USER_EMAIL"
EOF
