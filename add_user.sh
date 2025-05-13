#!/bin/bash
clear
# Check if the script is run with sudo
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}This script has to be run with sudo.${NC}"
    exit 1
fi

        read -p "What is the username?: " H2USER
        read -p "Do you want to add the user to sudo? (y/n): " H2ADDSUDO
        if id "$H2USER" &>/dev/null; then
            echo "User $H2USER already exists."
        else
            echo "User $H2USER does not exist. Creating user..."
            sudo adduser "$H2USER"
    
        # Only offer sudo add after successful creation
        if [[ "$H2ADDSUDO" == "y" || "$H2ADDSUDO" == "yes" ]]; then
            sudo adduser "$H2USER" sudo
            echo "$H2USER was added to the sudo group."
        else
            echo "$H2USER was not added to sudo."
            fi
        fi
