#!/bin/bash

omaforge_migrations_state_path=~/.local/state/omaforge/migrations
mkdir -p $omaforge_migrations_state_path

for file in ~/.local/share/omaforge/migrations/*.sh; do
  touch "$omaforge_migrations_state_path/$(basename "$file")"
done
