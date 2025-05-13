#!/bin/bash
RED="\e[31m"
NC="\e[0m"
clear
# Check if the script is run with sudo
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}This script has to be run with sudo.${NC}"
    exit 1
fi

echo -e "${RED}This script is WIP and will only install Apache2 (LAMP).${NC}"
echo -e "${RED}Press Enter to continue or Ctrl+C to cancel...${NC}"
read -r < /dev/tty
sudo apt update &>/dev/null
echo "Installing Apache2 LAMP"
sudo apt update &>/dev/null && sudo apt install -y apache2 mariadb-server php libapache2-mod-php php-mysql &>/dev/null
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php > /dev/null
echo "PHP files added to /var/www/html/info.php"
