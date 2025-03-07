#!/usr/bin/env bash

# Copyright (c) 2021-2025 community-scripts ORG
# Author: quantumryuu
# License: MIT
# https://github.com/community-scripts/ProxmoxVE/raw/main/LICENSE

source /dev/stdin <<<"$FUNCTIONS_FILE_PATH"
color
verb_ip6
catch_errors
setting_up_container
network_check
update_os

msg_info "Installing Dependencies"
$STD apt-get install -y
$STD apt-get update
$STD apt-get install -y \

msg_ok "Installed Dependencies"

msg_info "Setting up database"
  UPD=$(whiptail --backtitle "Proxmox VE Helper Scripts" --title "Choose DB option" --radiolist --cancel-button Exit-Script "Spacebar = Select" 11 58 3 \
    "1" "Local Server" ON \
    "2" "Remote Server" OFF \
    3>&1 1>&2 2>&3)

if [ "$UPD" == "1" ]; then
    echo "Local Server"
fi
if [ "$UPD" == "2" ]; then
    echo "Remote Server"
fi
DB_NAME=firefly
DB_USER=firefly
DB_PASS=$(openssl rand -base64 18 | tr -dc 'a-zA-Z0-9' | head -c13)

msg_ok "Set up database"

msg_info "Installing an app"

cd /opt



msg_ok "Installed App"

msg_info "Creating Service"

msg_ok "Created Service"

motd_ssh
customize

msg_info "Cleaning up"

msg_ok "Cleaned"
