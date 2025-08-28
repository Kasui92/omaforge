#!/bin/bash

# Copy over Omaforge configs
mkdir -p ~/.config
cp -R ~/.local/share/omaforge/config/* ~/.config/

# Configure the bash shell using Omaforge defaults
cp ~/.local/share/omaforge/default/bashrc ~/.bashrc