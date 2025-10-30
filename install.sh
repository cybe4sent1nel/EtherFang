#!/bin/bash

# Get absolute paths
REPO_PATH="$(cd "$(dirname "$0")" && pwd)"
TARGET_SCRIPT="$REPO_PATH/EtherFang.sh"
ICON_PATH="$REPO_PATH/imgs/icons/icon.png"

# Resolve real user home directory (even if run with sudo)
USER_HOME="${SUDO_USER:+$(getent passwd "$SUDO_USER" | cut -d: -f6)}"
USER_HOME="${USER_HOME:-$HOME}"
DESKTOP_FILE="$USER_HOME/.local/share/applications/EtherFang.desktop"

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

# Ensure applications directory exists
mkdir -p "$(dirname "$DESKTOP_FILE")"

# Create .desktop entry for app menu
echo "🖼️ Installing EtherFang to application menu..."
cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Name=EtherFang
Comment=Modular Wi-Fi Pentesting Toolkit
Exec=$TARGET_SCRIPT
Icon=$ICON_PATH
Terminal=true
Type=Application
Categories=Security;Network;Utility;
EOF

# Refresh desktop database (optional)
update-desktop-database "$USER_HOME/.local/share/applications/" 2>/dev/null

echo "🎉 Setup complete! You can now run EtherFang using:"
echo "    etherfang, EtherFang, or ETHERFANG"
echo "🖼️ And find it in your Linux app menu!"
