#!/bin/bash

set -o pipefail

ascii_art='
 ██████  ███    ███  █████  ███████  ██████  ██████   ██████  ███████
██    ██ ████  ████ ██   ██ ██      ██    ██ ██   ██ ██       ██
██    ██ ██ ████ ██ ███████ █████   ██    ██ ██████  ██   ███ █████
██    ██ ██  ██  ██ ██   ██ ██      ██    ██ ██   ██ ██    ██ ██
 ██████  ██      ██ ██   ██ ██       ██████  ██   ██  ██████  ███████
'

clear
echo -e "\n$ascii_art\n"

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

# Use custom repo if specified, otherwise use default
OMAFORGE_REPO="${OMAFORGE_REPO:-Kasui92/omaforge}"

echo -e "\e[32m\nCloning Omaforge...\e[0m"
rm -rf ~/.local/share/omaforge
git clone https://github.com/$OMAFORGE_REPO.git ~/.local/share/omaforge >/dev/null

if [[ -n "$OMAFORGE_REF" ]]; then
  echo -e "\e[32mUsing branch: $OMAFORGE_REF\e[0m"
	cd ~/.local/share/omaforge
	git fetch origin "${OMAFORGE_REF}" && git checkout "${OMAFORGE_REF}"
	cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/omaforge/install.sh
