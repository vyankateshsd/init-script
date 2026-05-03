sudo apt update

# install packages
sudo apt install -y \
    wget gpg curl \
    git podman gparted \
    python3 python3-pip python3-venv \
    flatpak gnome-software-plugin-flatpak 

# flatpak business
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak update -y
flatpak install -y md.obsidian.Obsidian

# install node
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install --lts

# add microsoft keys
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -D -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg
rm microsoft.gpg

# add vs code repo
sudo tee /etc/apt/sources.list.d/vscode.sources > /dev/null << 'EOF'
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF

# install vs code
sudo apt update
sudo apt install -y code

sudo apt autoremove -y