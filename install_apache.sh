#!/bin/bash
clear
# Check if the script is run with sudo
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}This script has to be run with sudo.${NC}"
    exit 1
fi

echo "" && read -p "This script is WIP and will only install apache2 LAMP press enter to start or stop the script" && clear
sudo apt update &>/dev/null
echo "Installing Apache2 LAMP"
sudo apt update &>/dev/null && sudo apt install -y apache2 mariadb-server php libapache2-mod-php php-mysql &>/dev/null
