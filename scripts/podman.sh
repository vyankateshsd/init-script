SRC=/hsh/configs/

echo "[+] Installing Podman"

# ==========
# Install podman
# ==========
sudo apt-get install -y podman

# ==========
# Configure podman
# ==========
mkdir -p ~/.config/containers/systemd

echo "[*] Copying Quadlet configurations"
cp "$SRC/containers/*.container" ~/.config/containers/systemd/


echo "[*] Enabling and starting Quadlet services"
systemctl --user daemon-reload
loginctl enable-linger $USER

systemctl --user start navidrome.service
systemctl --user start komga.service
systemctl --user start searxng.service
