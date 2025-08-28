#!/bin/bash

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Base Apps
apps=(
	"Flameshot"
	"Pinta"
	"LocalSend"
)

# Install optional apps
for app in "${apps[@]}"; do
	if [[ -f "$HOME/.local/share/omaforge/applications/install/${app,,}.sh" ]]; then
		source "$HOME/.local/share/omaforge/applications/install/${app,,}.sh"
	else
		echo "Warning: Installation script for $app not found."
	fi
done