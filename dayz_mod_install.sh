#!/bin/bash

# \e[1;32mAuthor:\e[0m fx0
# \e[1;34mWebsite:\e[0m www.dayzbalkan.com
# \e[1;33mThis script is open-source and can be used by anyone.\e[0m

# Steam user data
STEAM_APP_ID=223350
DAYZ_WORKSHOP_ID=221100
STEAMCMD_DIR="/home/dayzserver/serverfiles"
WORKSHOP_DIR="$STEAMCMD_DIR/steamapps/workshop/content/$DAYZ_WORKSHOP_ID"
MODS_DIR="$STEAMCMD_DIR"
KEYS_DIR="$STEAMCMD_DIR/keys"

# Ask the user for their Steam username
echo -n "Enter your Steam username: "
read STEAM_USER

# Ask the user for the mod ID
echo -n "Enter the Steam Workshop ID of the DayZ mod: "
read MOD_ID

# Download the mod using SteamCMD
echo "Downloading mod $MOD_ID..."
steamcmd +force_install_dir "$STEAMCMD_DIR" +login "$STEAM_USER" +app_update "$STEAM_APP_ID" +workshop_download_item "$DAYZ_WORKSHOP_ID" "$MOD_ID" +quit

# Wait to ensure the download is complete
while [ ! -d "$WORKSHOP_DIR/$MOD_ID" ]; do
    echo "Waiting for the mod to download..."
    sleep 10
done

# Check if the mod directory exists
if [ -d "$WORKSHOP_DIR/$MOD_ID" ]; then
    MOD_NAME=$(basename "$WORKSHOP_DIR/$MOD_ID")
    MOD_TARGET="$MODS_DIR/@$MOD_NAME"
    echo "Creating a symbolic link for the mod: $MOD_NAME"
    ln -s "$WORKSHOP_DIR/$MOD_ID" "$MOD_TARGET"
    
    # Move key files
    if [ -d "$WORKSHOP_DIR/$MOD_ID/keys" ]; then
        echo "Moving key files..."
        for keyfile in "$WORKSHOP_DIR/$MOD_ID/keys"/*; do
            keyname=$(basename "$keyfile")
            if [ ! -e "$KEYS_DIR/$keyname" ]; then
                ln -s "$keyfile" "$KEYS_DIR/"
                echo "Key $keyname added."
            else
                echo "Key $keyname already exists, skipping."
            fi
        done
    else
        echo "No key files found."
    fi
    
    echo "Mod successfully installed!"
else
    echo "Error: Mod not found!"
fi
