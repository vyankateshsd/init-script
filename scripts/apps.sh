SRC="/hsh/configs"

echo "[+] Installing user apps"

# ==========
# Install APT apps
# ==========
sudo apt-get install -y \
    git code firefox

# ==========
# Install Flatpak apps
# ==========
flatpak install -y flathub md.obsidian.Obsidian


echo "[+] Installing GNOME Extensions"

# ==========
# Install GNOME Extensions
# ==========
pipx install gnome-extensions-cli -q

gext install dash-to-dock@micxgx.gmail.com
gext install gtk4-ding@smedius.gitlab.com


echo "[-] Configuring user apps"

# ==========
# Configure Firefox
# ==========
cp "$SRC/apps/firefox/prefs.js" ~/.mozilla/firefox/*.default-release/
cp "$SRC/apps/firefox/xulstore.json" ~/.mozilla/firefox/*.default-release/
cp "$SRC/apps/firefox/content-prefs.sqlite" ~/.mozilla/firefox/*.default-release/
cp "$SRC/apps/firefox/permissions.sqlite" ~/.mozilla/firefox/*.default-release/

# ==========
# Configure Obsidian
# ==========
cp "$SRC/apps/obsidian.json" ~/.var/app/md.obsidian.Obsidian/config/obsidian/

# ==========
# Configure VS Code
# ==========
cp "$SRC/apps/vscode/settings.json" ~/.config/Code/User/ 

while IFS= read -r ext; do
    [ -z "$ext" ] && continue
    code --install-extension "$ext"
done < "$SRC/apps/vscode/extensions.txt"