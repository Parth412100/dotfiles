#!/bin/bash

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"

# -----------------------
# 1. Install needed packages
# -----------------------
# removing packages

echo "removing packages"
rm ~/.local/share/applications/HEY.desktop  #removing hey
sudo pacman -Rns --noconfirm signal-desktop obsidian 1password-beta 1password-cli

echo "Installing required packages..."
yay -S --noconfirm --needed mpv fastfetch btop git yt-dlp ani-cli blueman zen-browser-bin lvsk-calendar

. ./calender.sh

