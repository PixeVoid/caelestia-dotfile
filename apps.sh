#!/bin/bash

echo "╭─────────────────────────────────╮"
echo "│     Ankit's App Installer       │"
echo "╰─────────────────────────────────╯"
echo ""

install() {
    yay -S --noconfirm "$@"
}

ask() {
    read -p "Install $1? [y/N] " choice
    [[ "$choice" == "y" || "$choice" == "Y" ]]
}

# --- Browsers ---
ask "Google Chrome" && install google-chrome
ask "Brave" && install brave-bin

# --- Communication ---
ask "Discord" && install discord
ask "Ferdium (all-in-one messaging)" && install ferdium-bin

# --- Media ---
ask "Spotify + Spicetify + Marketplace" && install spotify spicetify-cli spicetify-marketplace-bin
ask "VLC" && install vlc

# --- Development ---
ask "VSCode" && install code
ask "Neovim" && install neovim
ask "Micro (easy terminal editor)" && install micro
ask "Antigravity (Google AI IDE)" && install antigravity
ask "Git" && install git

# --- Java ---
ask "JDK OpenJDK + BlueJ" && install jdk-openjdk bluej

# --- Creative ---
ask "Blender" && install blender

# --- Office ---
ask "LibreOffice" && install libreoffice-fresh

# --- File Management ---
ask "Thunar (file manager)" && install thunar
ask "Dolphin (file manager)" && install dolphin
ask "ncdu (terminal disk usage)" && install ncdu

# --- Clipboard ---
ask "Clipse + Kitty (clipboard manager)" && install clipse kitty wl-clipboard

# --- Shell ---
ask "Fish shell" && install fish
ask "Rofi (keybind cheatsheet)" && install rofi

# --- ASUS Tools ---
ask "ASUS Tools (asusctl, rog-control, supergfxctl)" && install asusctl rog-control-center supergfxctl

# --- System ---
ask "Polkit GNOME (authentication popups)" && install polkit-gnome
ask "Pipewire (audio)" && install pipewire pipewire-alsa pipewire-jack gst-plugin-pipewire
ask "Bluez (bluetooth)" && install bluez bluez-utils
ask "Power profiles daemon" && install power-profiles-daemon
ask "NVIDIA drivers" && install nvidia-open-dkms nvidia-prime libva-nvidia-driver
ask "Spicetify CLI + Marketplace" && install spicetify-cli spicetify-marketplace-bin

echo ""
echo "✅ Done! Run 'hyprctl reload' to apply changes."
