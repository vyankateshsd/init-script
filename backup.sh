# Take input for destination directory
read -rp "Enter backup destination path: " DEST

# Make sure directories exist
mkdir -p "$DEST/" "$DEST/desktop/" "$DEST/keybinds/" "$DEST/apps/" "$DEST/apps/firefox/" "$DEST/apps/vscode/"

# GNOME back up
echo "[-] Backing up GNOME Extensions configuration"
dconf dump /org/gnome/shell/extensions/ > "$DEST/desktop/gnome-extensions.ini"

echo "[-] Backing up other desktop settings"
gsettings get org.gnome.shell favorite-apps > "$DEST/desktop/dock-items.txt"
dconf dump /org/gnome/desktop/wm/preferences/ > "$DEST/desktop/wm-prefs.ini"

dconf dump /org/gnome/desktop/background/ > "$DEST/desktop/bg.ini"
dconf dump /org/gnome/desktop/interface/ > "$DEST/desktop/interface.ini"

# Key binds back up
echo "[-] Backing up key binds"
dconf dump /org/gnome/desktop/wm/keybindings/ > "$DEST/keybinds/wm.ini"
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > "$DEST/keybinds/custom.ini"
dconf dump /org/gnome/shell/keybindings/ > "$DEST/keybinds/gnome-shell.ini"

# Application config backup
echo "[-] Backing up VS Code settings"
cp ~/.config/Code/User/settings.json "$DEST/apps/vscode/settings.json"
code --list-extensions > "$DEST/apps/vscode/extensions.txt"

echo "[-] Backing up Obsidian settings"
cp ~/.var/app/md.obsidian.Obsidian/config/obsidian/obsidian.json "$DEST/apps/"

echo "[-] Backing up Firefox settings"
cp ~/.mozilla/firefox/*.default-release/content-prefs.sqlite "$DEST/apps/firefox/"
cp ~/.mozilla/firefox/*.default-release/prefs.js "$DEST/apps/firefox/"
cp ~/.mozilla/firefox/*.default-release/xulstore.json "$DEST/apps/firefox/"
cp ~/.mozilla/firefox/*.default-release/permissions.sqlite "$DEST/apps/firefox/"

# Misc
echo "[-] Backing up misc configs"
cp ~/.config/user-dirs.dirs "$DEST/"
cp ~/.gitconfig "$DEST/"

echo "[!] Done"