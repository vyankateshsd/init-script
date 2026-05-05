DEST="/hsh/configs"     # This is where I store my configuration backups.

# Make sure directories required exist
mkdir -p \
    "$DEST/desktop/" \
    "$DEST/keybinds/" \
    "$DEST/apps/firefox/" \
    "$DEST/apps/vscode/"


# ==========
# INFO 
# ==========

# Many GNOME and app settings are stored in dconf database
# under /org/ namespace.

# dconf command is used access groups of settings
# gsettings command is used to access individual settings   

# dconf dump  /org/../ prints the group of settings at that path

# Similarly
# gsettings get org.x.x prints a specific setting

# Command outputs are redirected to files for backup

# ==========
# GNOME Back up
# ==========
echo "[-] Backing up GNOME Extensions configuration"
dconf dump /org/gnome/shell/extensions/ > "$DEST/desktop/gnome-extensions.ini"


# ==========
# Desktop Back up
# ==========
echo "[-] Backing up other desktop settings"
gsettings get org.gnome.shell favorite-apps > "$DEST/desktop/dock-items.txt"            # Taskbar items
dconf dump /org/gnome/desktop/wm/preferences/ > "$DEST/desktop/wm-prefs.ini"            # Window manager preferences (button layout, placement, behavior)
dconf dump /org/gnome/desktop/background/ > "$DEST/desktop/bg.ini"                      # Information about desktop background
dconf dump /org/gnome/desktop/interface/ > "$DEST/desktop/interface.ini"                # # Interface settings (theme, color scheme, battery percentage, etc.)


# ==========
# Key binds Back up
# ==========
echo "[-] Backing up key binds"
dconf dump /org/gnome/desktop/wm/keybindings/ > "$DEST/keybinds/wm.ini"                 # Window management shortcuts
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > "$DEST/keybinds/custom.ini" # Any custom shortcuts
dconf dump /org/gnome/shell/keybindings/ > "$DEST/keybinds/gnome-shell.ini"             # GNOME shortcuts


# ==========
# VS Code Back up
# ==========
echo "[-] Backing up VS Code settings"
# All global VS Code settings are stored in this file
# Includes extension settings, but not the list of installed extensions
cp ~/.config/Code/User/settings.json "$DEST/apps/vscode/settings.json"

code --list-extensions > "$DEST/apps/vscode/extensions.txt"                             # Extracts list of installed extensions


# ==========
# Obsidian Back up
# ==========
echo "[-] Backing up Obsidian settings"
# Obsidian Vaults are stored in self contained folder.
# Each vault folder stores the notes, extensions, their settings, and theme used.
# Obsidian refers to a list of known vaults to open on launch.
cp ~/.var/app/md.obsidian.Obsidian/config/obsidian/obsidian.json "$DEST/apps/"          # This file contains the list of known vaults.


# ==========
# Firefox Back up
# ==========
echo "[-] Backing up Firefox settings"
# Firefox sync backs up the following from your profile
#  bookmarks, passwords, history, payment methods,
#  addons or extensions, and some settings.
# However, some settings like layout and zoom preferences are
#  not backed up by Firefox Sync. They are backed up below. 
cp ~/.mozilla/firefox/*.default-release/prefs.js "$DEST/apps/firefox/"                  # This file contains Browser level preferences like telemetry
cp ~/.mozilla/firefox/*.default-release/xulstore.json "$DEST/apps/firefox/"             # This file contains the layout of the Firefox windows
cp ~/.mozilla/firefox/*.default-release/content-prefs.sqlite "$DEST/apps/firefox/"      # These two files together contain site-specific
cp ~/.mozilla/firefox/*.default-release/permissions.sqlite "$DEST/apps/firefox/"        # settings such as zoom level and site permissions


# ==========
# Misc Back up
# ==========
echo "[-] Backing up misc configs"

# This file contains the locations of certain most used
#  directories of the user. Ex. Desktop, Documents, Downloads, etc
# Many applications use it to determine default storage locations
#  for Downloads and Documents.
# In my case, the GNOME extension Desktop Icons NG refers to this 
#  folder to determine the location of Desktop folder.
cp ~/.config/user-dirs.dirs "$DEST/"

# Git config.
cp ~/.gitconfig "$DEST/"

echo "[!] Done"