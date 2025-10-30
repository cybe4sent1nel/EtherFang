#!/bin/bash

# Get absolute paths
REPO_PATH="$(cd "$(dirname "$0")" && pwd)"
TARGET_SCRIPT="$REPO_PATH/EtherFang.sh"
ICON_PATH="$REPO_PATH/imgs/assets/icon.png"
DESKTOP_FILE="$HOME/.local/share/applications/EtherFang.desktop"

echo "🔧 Setting up EtherFang..."

# Ensure main script is executable
chmod +x "$TARGET_SCRIPT"

# Create lowercase symlink
echo "🔗 Creating symlink at /usr/local/bin/etherfang..."
sudo ln -sf "$TARGET_SCRIPT" /usr/local/bin/etherfang

# Add aliases to shell configs
for SHELL_RC in "$HOME/.bashrc" "$HOME/.zshrc"; do
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
mkdir -p "$HOME/.local/share/applications/"

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
update-desktop-database ~/.local/share/applications/ 2>/dev/null

echo "🎉 Setup complete! You can now run EtherFang using:"
echo "    etherfang, EtherFang, or ETHERFANG"
echo "🖼️ And find it in your Linux app menu!"
