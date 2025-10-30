#!/bin/bash

# Get absolute paths
REPO_PATH="$(cd "$(dirname "$0")" && pwd)"
TARGET_SCRIPT="$REPO_PATH/EtherFang.sh"
ICON_SOURCE="$REPO_PATH/imgs/icons/icon.png"
ICON_TARGET="$HOME/.local/share/icons/etherfang.png"

# Resolve real user home directory (even if run with sudo)
USER_HOME="${SUDO_USER:+$(getent passwd "$SUDO_USER" | cut -d: -f6)}"
USER_HOME="${USER_HOME:-$HOME}"
DESKTOP_FILE="$USER_HOME/.local/share/applications/EtherFang.desktop"
WRAPPER_PATH="/usr/local/bin/etherfang-wrapper"

echo "🔧 Setting up EtherFang..."

# Ensure main script is executable
chmod +x "$TARGET_SCRIPT"

# Create lowercase symlink
echo "🔗 Creating symlink at /usr/local/bin/etherfang..."
sudo ln -sf "$TARGET_SCRIPT" /usr/local/bin/etherfang

# Add aliases to shell configs
for SHELL_RC in "$USER_HOME/.bashrc" "$USER_HOME/.zshrc"; do
  if [ -f "$SHELL_RC" ]; then
    {
      echo ""
      echo "# EtherFang aliases"
      echo "alias etherfang='$TARGET_SCRIPT'"
      echo "alias EtherFang='$TARGET_SCRIPT'"
      echo "alias ETHERFANG='$TARGET_SCRIPT'"
    } >> "$SHELL_RC"
    echo "✅ Aliases added to $SHELL_RC"
  fi
done

# Resize and register icon
mkdir -p "$(dirname "$ICON_TARGET")"
if command -v convert &>/dev/null; then
  convert "$ICON_SOURCE" -resize 256x256 "$ICON_TARGET"
  echo "🖼️ Icon resized and saved to $ICON_TARGET"
else
  cp "$ICON_SOURCE" "$ICON_TARGET"
  echo "⚠️ ImageMagick not found — using original icon without resizing"
fi

# Create wrapper script for sudo launch
echo "📦 Creating wrapper at $WRAPPER_PATH..."
sudo bash -c "cat > $WRAPPER_PATH" <<EOF
#!/bin/bash
cd "$REPO_PATH"
exec sudo bash ./EtherFang.sh
EOF
sudo chmod +x "$WRAPPER_PATH"

# Create .desktop entry for KDE (konsole)
mkdir -p "$(dirname "$DESKTOP_FILE")"
echo "🖼️ Installing EtherFang to application menu..."
cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Name=EtherFang
Comment=Modular Wi-Fi Pentesting Toolkit
Exec=konsole --noclose -e etherfang-wrapper
Icon=etherfang
Type=Application
Categories=Security;Network;Utility;
EOF

# Refresh desktop and icon caches
update-desktop-database "$USER_HOME/.local/share/applications/" 2>/dev/null
gtk-update-icon-cache "$USER_HOME/.local/share/icons" 2>/dev/null

# Check locale status
echo "🌐 Checking system locale..."
if ! locale | grep -q "en_US.UTF-8"; then
  echo "⚠️ Locale en_US.UTF-8 not active. You may see UTF-8 errors in Qt apps."
  echo "👉 To fix: run 'sudo nano /etc/locale.gen', uncomment 'en_US.UTF-8 UTF-8', then:"
  echo "    sudo locale-gen"
  echo "    sudo update-locale LANG=en_US.UTF-8"
  echo "    sudo reboot"
fi

echo "🎉 Setup complete! You can now run EtherFang using:"
echo "    etherfang, EtherFang, or ETHERFANG"
echo "🖼️ And find it in your Linux app menu with root access!"
