echo "[+] Installing apt packages"

sudo apt remove -y firefox-esr || true
sudo apt install -y gnome-tweaks code firefox git


echo "[+] Installing Flatpaks"

flatpak install -y flathub md.obsidian.Obsidian

echo "[+] Installing GNOME Extensions"

gext install dash-to-dock@micxgx.gmail.com || true
gext install gtk4-ding@smedius.gitlab.com || true