SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


echo "[-] Configuring GNOME Extensions"

gext enable dash-to-dock@micxgx.gmail.com || true
gext enable gtk4-ding@smedius.gitlab.com || true

dconf load /org/gnome/shell/extensions/dash-to-dock/ < "$SCRIPT_DIR/gnome/dash.ini"
dconf load /org/gnome/shell/extensions/gtk4-ding/ < "$SCRIPT_DIR/gnome/desktop.ini"


echo "[-] Configuring other GNOME settings"

gsettings set org.gnome.shell favorite-apps "$(cat "$SCRIPT_DIR/gnome/favorites.txt")"
dconf load /org/gnome/desktop/wm/preferences/ < "$SCRIPT_DIR/gnome/wm.ini"
dconf load /org/gnome/nautilus/preferences/ < "$SCRIPT_DIR/gnome/nautilus.ini"


echo "[-] Configuring key binds"

dconf load /org/gnome/settings-daemon/plugins/media-keys/ < "$SCRIPT_DIR/gnome/shortcuts.ini"


echo "[-] Configuring Git"

git config --global user.name "Vyankatesh Dande"
git config --global user.email "vyankateshdande.vd@gmail.com"
git config --global init.defaultBranch main

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  ssh-keygen -t ed25519 -C "vyankateshdande.vd@gmail.com" -f "$HOME/.ssh/id_ed25519" -N ""
fi

cat > "$HOME/.ssh/config" << 'EOF'
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519
  AddKeysToAgent yes
EOF

chmod 600 "$HOME/.ssh/config"

echo "[!] Add this key to GitHub:"
cat "$HOME/.ssh/id_ed25519.pub"