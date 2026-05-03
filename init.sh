#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

. "$SCRIPT_DIR/system-installs.sh"
. "$SCRIPT_DIR/system-config.sh"
. "$SCRIPT_DIR/user-installs.sh"
. "$SCRIPT_DIR/user-config.sh"

sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
