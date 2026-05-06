SRC="/hsh/configs"

echo "[-] Configuring GNOME Extensions"
dconf load /org/gnome/shell/extensions/ < "$SRC/desktop/gnome-extensions.ini"

echo "[-] Configuring Desktop settings"
gsettings set org.gnome.shell favorite-apps "$(cat "$SRC/desktop/dock-items.txt")"
dconf load /org/gnome/desktop/wm/preferences/ < "$SRC/desktop/wm-prefs.ini"
dconf load /org/gnome/desktop/background/ < "$SRC/desktop/bg.ini"
dconf load /org/gnome/desktop/interface/ < "$SRC/desktop/interface.ini"

echo "[-] Configuring keybinds/shortcuts"
dconf load /org/gnome/desktop/wm/keybindings/ < "$SRC/keybinds/wm.ini"
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < "$SRC/keybinds/custom.ini"
dconf load /org/gnome/shell/keybindings/ < "$SRC/keybinds/gnome-shell.ini"

echo "[-] Configuring misc. configs"
cp "$SRC/user-dirs.dirs" ~/.config/
cp "$SRC/.gitconfig" ~/