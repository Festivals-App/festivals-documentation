#!/bin/bash
#
# vm-init.sh - Server Initialization Script
#
# (c) 2021-2025 Simon Gaus
#

# ─────────────────────────────────────────────────────────────────
# 🛑 Check if all parameters are supplied
# ─────────────────────────────────────────────────────────────────
if [ $# -ne 2 ]; then
    echo -e "\n\033[1;31m🚨  ERROR: Missing parameters!\033[0m"
    echo -e "\033[1;34m🔹  USAGE:\033[0m sudo ./vm-init.sh \033[1;32m<admin_name> <admin_password>\033[0m"
    echo -e "\033[1;31m❌  Exiting.\033[0m\n"
    exit 1
fi

# ─────────────────────────────────────────────────────────────────────────────
# 🎯 Store parameters in variables
# ─────────────────────────────────────────────────────────────────────────────
admin_name=$1
admin_password=$2

echo -e "\n✅  Password and username are valid."
sleep 1

# ─────────────────────────────────────────────────────────────────────────────
# 🛠 Function: Create Admin User
# ─────────────────────────────────────────────────────────────────────────────
create_admin_user() {
    echo -e "🆕  Creating admin account: \e[1;34m$admin_name\e[0m"
    sleep 1

    if adduser --help | grep -q -- "--gecos"; then
        adduser --disabled-password --gecos "" "$admin_name" > /dev/null
    elif adduser --help | grep -q -- "--comment"; then
        adduser --disabled-password --comment "" "$admin_name" > /dev/null
    else
        adduser --disabled-password "$admin_name"
    fi

    chpasswd <<<"$admin_name:$admin_password"

    echo -e "🔑  Setting privileges for \e[1;34m$admin_name\e[0m"
    usermod -aG sudo "$admin_name"
    sleep 1

    echo -e "🔐  Enabling SSH access for \e[1;34m$admin_name\e[0m"
    rsync --archive --chown="$admin_name:$admin_name" ~/.ssh "/home/$admin_name"
    sleep 1
}

# ─────────────────────────────────────────────────────────────────────────────
# 👤 Check if user already exists
# ─────────────────────────────────────────────────────────────────────────────
if ! id -u "$admin_name" > /dev/null 2>&1; then
    create_admin_user
else
    echo -e "⚠️  Admin account \e[1;34m$admin_name\e[0m already exists. Skipping user creation."
    sleep 1
fi

# ─────────────────────────────────────────────────────────────────────────────
# 🔥 Enable and Configure Firewall
# ─────────────────────────────────────────────────────────────────────────────
if command -v ufw > /dev/null; then
    echo -e "🔥  Configuring firewall (UFW)..."
    ufw default deny incoming > /dev/null
    ufw default allow outgoing > /dev/null
    ufw allow OpenSSH > /dev/null
    yes | sudo ufw enable > /dev/null

    echo -e "🟢  UFW Firewall Enabled & Configured!"
    sleep 1
elif ! [ "$(uname -s)" = "Darwin" ]; then
    echo -e "\n❌  No firewall detected and not on macOS. Exiting.\n"
    sleep 1
    exit 1
fi

echo -e "🎉  \e[1;32mServer initialization complete!\e[0m 🚀\n"
