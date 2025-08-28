#!/bin/bash

# Use Wayland by default
sudo sed -i 's/^#WaylandEnable=false/WaylandEnable=true/' /etc/gdm3/custom.conf

# Enable GDM3 service
sudo systemctl enable gdm3

# ==============================================================================
# GDM DISABLE XORG AND CLASSIC (Force to use Wayland)
# ==============================================================================

sudo rm -f /usr/share/xsessions/gnome.desktop
sudo rm -f /usr/share/xsessions/gnome-xorg.desktop

# ==============================================================================
# GDM OMAFORGE LOGO SETUP
# ==============================================================================

# Get the directory where this script is located
OMAFORGE_GDM_LOGO="$HOME/.local/share/omaforge/default/gdm/logo.png"
OMAFORGE_GDM_BACKGROUND="$HOME/.local/share/omaforge/default/gdm/background.png"

# Copy Omaforge logo and background to system directory
sudo mkdir -p /usr/share/pixmaps/omaforge/
if [ -f "$OMAFORGE_GDM_LOGO" ]; then
  sudo cp "$OMAFORGE_GDM_LOGO" /usr/share/pixmaps/omaforge/gdm-logo.png
fi
if [ -f "$OMAFORGE_GDM_BACKGROUND" ]; then
  sudo cp "$OMAFORGE_GDM_BACKGROUND" /usr/share/pixmaps/omaforge/gdm-background.png
fi

# Copy Omaforge GDM greeter configuration
OMAFORGE_GDM_CONFIG="$HOME/.local/share/omaforge/default/gdm/greeter.dconf-defaults"
if [ -f "$OMAFORGE_GDM_CONFIG" ]; then
  sudo cp "$OMAFORGE_GDM_CONFIG" /etc/gdm3/greeter.dconf-defaults
  echo "GDM configuration applied successfully"
else
  echo "Warning: GDM configuration file not found"
fi

# Update dconf database
sudo dconf update
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/