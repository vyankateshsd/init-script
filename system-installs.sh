echo "[+] Installing apt packages"

sudo apt update
sudo apt install -y \
    wget gpg curl \
    git podman gparted \
    python3 python3-pip python3-venv pipx \
    flatpak gnome-software-plugin-flatpak


echo "[+] Installing pip packages"

pipx ensurepath
export PATH="$HOME/.local/bin:$PATH"

pipx install gnome-extensions-cli || true


echo "[+] Installing NVM and Node"

curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm install --lts