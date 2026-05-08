echo "[+] Installing runtimes"

# ==========
# Install Python essentials
# ==========
echo "|- Installing Python"
sudo apt-get install -y -q \
    python3 python3-pip

# ==========
# Install NVM and Node
# ==========
echo "|- Installing NVM"
if [ ! -d "$HOME/.nvm" ]; then
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
source ~/.bashrc
fi

echo "|- Installing NodeJS"
nvm install --lts


# ==========
# Install C & C++
# ==========
echo "|- Installing C & C++ tools"
sudo apt-get install -y \
    gcc g++ gdb make cmake libncurses-dev flex bison


echo "[+] Installing runtime extras"
# ==========
# Install Python extras
# ==========
echo "|- Installing Python packages (venv, pipx)"
sudo apt-get install -y python3-venv pipx
pipx ensurepath -q

# ==========
# Install Node extras
# ==========
echo "|- Installing npm packages (Typescript)"
npm install --global typescript


## Refresh PATH
source ~/.bashrc