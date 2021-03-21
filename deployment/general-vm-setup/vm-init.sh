#!/bin/bash
#
# vm-init.sh 1.0.0
#
# <Description>
#
# (c)2021 Simon Gaus
#

# Check if all parameters are supplied
#
if [ $# -ne 2 ]; then
    echo "$0: usage: sudo ./vm-init.sh <admin_name> <admin_password>"
    exit 1
fi

# Store password and name in variables
#
admin_name=$1
admin_password=$2
echo "Password and username are valid"
sleep 1

# Create the user that will be used for administrate this server.
#
echo "Creating the admin account"
adduser --gecos "" --disabled-password $admin_name
chpasswd <<<"$admin_name:$admin_password"
sleep 1

# Set privileges for the admin account.
#
echo "Set privileges for the admin account"
usermod -aG sudo $admin_name
sleep 1

# Enables and configures the firewall.
# Supported firewalls: ufw and firewalld
# This step is skipped under macOS.
#
if command -v firewalld > /dev/null; then

  systemctl enable firewalld >/dev/null
  systemctl start firewalld >/dev/null
  echo "Enabled firewalld"
  sleep 1

  firewall-cmd --permanent --add-service=ssh >/dev/null
  firewall-cmd --reload >/dev/null
  echo "Added ssh service to firewalld rules"
  sleep 1

elif command -v ufw > /dev/null; then

  ufw default deny incoming
  ufw default allow outgoing
  ufw allow OpenSSH
  yes | sudo ufw enable >/dev/null
  echo "Enabled ufw"
  sleep 1

elif ! [ "$(uname -s)" = "Darwin" ]; then
  echo "No firewall detected and not on macOS. Exiting."
  sleep 1
  exit 1
fi
