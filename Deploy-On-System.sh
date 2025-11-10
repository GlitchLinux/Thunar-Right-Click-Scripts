#!/bin/bash
# deploy-thunar-actions.sh
# Downloads and installs Thunar custom actions from GitHub

set -e

# --- URLs ---
UCA_URL="https://raw.githubusercontent.com/GlitchLinux/Thunar-Right-Click-Scripts/refs/heads/main/uca.xml"
ACCELS_URL="https://raw.githubusercontent.com/GlitchLinux/Thunar-Right-Click-Scripts/refs/heads/main/accels.scm"

# --- Destination paths ---
CONFIG_DIR="$HOME/.config/Thunar"
UCA_FILE="$CONFIG_DIR/uca.xml"
ACCELS_FILE="$CONFIG_DIR/accels.scm"

# --- Ask for dependency installation ---
read -p "Do you want to install all required dependencies? [y/N] " install_deps
if [[ "$install_deps" =~ ^[Yy]$ ]]; then
    echo "Installing dependencies..."
    sudo apt update
    sudo apt install -y \
        bash \
        coreutils \
        xclip \
        tree \
        p7zip-full \
        qemu-system-x86 \
        ovmf \
        ark \
        kdialog \
        zenity \
        nano \
        thunar \
        xfce4-terminal \
        python3 \
        ffmpeg \
        libnotify-bin \
        exo-utils
fi

# --- Create config directory if missing ---
mkdir -p "$CONFIG_DIR"

# --- Download files ---
echo "Downloading Thunar custom actions..."
curl -fsSL "$UCA_URL" -o "$UCA_FILE"
curl -fsSL "$ACCELS_URL" -o "$ACCELS_FILE"

echo "Files deployed:"
echo " - $UCA_FILE"
echo " - $ACCELS_FILE"

echo "Deployment complete. You may need to restart Thunar for changes to take effect:"
echo "  thunar -q && thunar"
