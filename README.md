# DayZ Mod Install

A bash script to easily install and manage DayZ mods via SteamCMD. This script downloads mods from the Steam Workshop, creates necessary symbolic links, and installs mod key files for your DayZ server.

## Features

- Downloads DayZ mods from the Steam Workshop.
- Creates symbolic links for the mod in the appropriate directory.
- Handles mod key file installation.

## Prerequisites

- A Linux server with root or sudo access.
- SteamCMD installed on your system.
- A DayZ server running and configured.
- Your Steam username and the Steam Workshop mod ID.

## Installation

### 1. Install SteamCMD (if not already installed)

If you don't have SteamCMD installed on your system, you can install it with the following steps:


> sudo apt update

> sudo apt install steamcmd

## 2. Download the Script

Clone the repository to your server:
> git clone https://github.com/DayZ-Balkan/dayz-mod-install.git
> 
> cd dayz-mod-install

Alternatively, you can download the script manually and place it on your server.

## 3. Make the Script Executable
Before running the script, you need to give it execute permissions:
> chmod +x dayz_mod_installer.sh

## 4. Edit the Script (Optional)
Ensure the STEAMCMD_DIR variable is set to the correct path where SteamCMD is installed and the DayZ server files are located.

## 5. Run the Script
Run the script:
> ./dayz_mod_install.sh

## 6. Follow the Prompts
The script will prompt you for your Steam username and the Steam Workshop ID of the DayZ mod you'd like to install. You can find the mod ID in the URL of the mod's Steam Workshop page.

For example, for this mod:
> https://steamcommunity.com/sharedfiles/filedetails/?id=1234567890

The mod ID would be **1234567890**.

## Usage
After the script finishes running, your mod will be installed, and a symbolic link will be created in the **@modname** format in your server's Mods directory. The key files (if any) will also be moved to the correct keys directory.

## License
This script is open-source and free to use. Feel free to contribute!
