#!/bin/bash

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"

# -----------------------
# 1. Install needed packages
# -----------------------
echo "Installing required packages..."
yay -S --noconfirm --needed fastfetch btop git blueman zen-browser-bin

# -----------------------
# 2. Clone dotfiles repo
# -----------------------
if [ ! -d "$DOTFILES" ]; then
    echo "Cloning dotfiles..."
    git clone https://github.com/Parth412100/dotfiles "$DOTFILES"
fi

cd "$DOTFILES" || exit

# -----------------------
# 3. Remove old config folders
# -----------------------
remove_configs=(
    fastfetch
    git
    omarchy
    btop
    waybar
    hypr
    kitty
)

echo "Cleaning old configs..."
for folder in "${remove_configs[@]}"; do  
  rm -rf "$CONFIG/$folder"
  echo "Removed: $folder"
done

# -----------------------
# 4. Symlink everything
# -----------------------
link_folders=(
    fastfetch
    git
    btop
    omarchy
    waybar
    hypr
    kitty
)

echo "Creating symlinks..."
for folder in "${link_folders[@]}"; do
    ln -sfn "$DOTFILES/$folder" "$CONFIG/$folder"
    echo "Linked: $folder"
done

# -----------------------
# 5. Symlink scripts to /usr/local/bin
# -----------------------
echo "Linking scripts..."
sudo ln -sf "$DOTFILES/scripts/myscript.sh" /usr/local/bin/myscript

echo "All done! 🎉 Your system is now configured."

