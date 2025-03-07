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
read -r -p "Would you like to install local db server? <y/N> " prompt
if [[ "${prompt,,}" =~ ^(y|yes)$ ]]; then
  msg_info "Installing Adminer"
 
  msg_ok "Installed db server"
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
