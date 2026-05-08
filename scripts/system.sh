# ==========
# Install general system tools
# ==========
echo "[+] Installing general system tools"
sudo apt-get install -y \
    wget curl gpg cpio gparted


echo "[+] Installing package managers"

# ==========
# Install Flatpak
# ==========
echo "|- Installing Flatpak"
sudo apt-get install -y \
    flatpak \
    gnome-software-plugin-flatpak           # GNOME - Flatpak integration

# ==========
# Install QEMU
# ==========
echo "|- Installing QEMU"
sudo apt-get install -y qemu-system qemu-utils qemu-kvm

echo "[-] Configuring package managers"

# ==========
# Configure APT repos
# ==========
echo "|- Configuring APT"
## Add Microsoft key
if [ ! -f /usr/share/keyrings/microsoft.gpg ]; then
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -D -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg
rm microsoft.gpg
fi

## Add VS Code repository
if [ ! -f /etc/apt/sources.list.d/vscode.sources ]; then
sudo tee /etc/apt/sources.list.d/vscode.sources > /dev/null << 'EOF'
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF
fi

## Add Mozilla key
if [ ! -f /etc/apt/keyrings/packages.mozilla.org.asc ]; then
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null 
fi

## Add Mozilla repository
if [ ! -f /etc/apt/sources.list.d/mozilla.sources ]; then
sudo tee /etc/apt/sources.list.d/mozilla.sources > /dev/null << 'EOF'
Types: deb
URIs: https://packages.mozilla.org/apt
Suites: mozilla
Components: main
Signed-By: /etc/apt/keyrings/packages.mozilla.org.asc
EOF 
fi

## Refresh APT
sudo apt-get update -y

# ==========
# Configure Flatpak repo
# ==========
echo "|- Configuring Flatpak"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
