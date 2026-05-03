# init script

this is a personalised init script for a freshly installed debian with GNOME system

it installs commonly used apps and dev tools, and configures GNOME desktop environment to my preferences


## usage

### prerequisites

- fresh Debian installation with GNOME 
- internet access

### to run it
clone the repository and run:

```bash
sudo ./init.sh
```


## overview

the setup is divided into four stages:

### `system-installs.sh`

installs core system dependencies, including:
- command-line utilities (ex curl, wget)
- system tools (ex Flatpak, podman)
- runtimes (ex NodeJS, Python)


### `system-config.sh`

adds the following repositories:
- Flathub (Flatpak)
- Microsoft repository (for VS Code)


### `user-installs.sh`

installs user apps and GNOME extensions


### `user-config.sh`

applies user-specific configs such as
- GNOME extensions and settings
- keybindings and preferences
- Git configuration

it also generates a SSH key to be used for remote access to GitHub

sample output: 
```bash
ssh-ed25519 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX vyankateshdande.vd@gmail.com
```

add this key to your GitHub account at https://github.com/settings/keys > "New SSH key"

now you can push to your GitHub repositories with Git CLI

> note: order of the scripts is important. the scripts are not meant to be run individually.

## future plans

- add setup for podman containers of:
  - music server
  - book server
- start from minimal install of Debian, without GNOME
