#!/bin/bash
#
# vm-init.sh
#
# (c)2021-2025 Simon Gaus
#

# Check if all parameters are supplied
#
if [ $# -ne 2 ]; then
    echo "$0: usage: sudo ./vm-init.sh <admin_name> <admin_password>"
    echo
    exit 1
fi

# Store password and name in variables
#
admin_name=$1
admin_password=$2
echo "Password and username are valid"
echo
sleep 1

# Check if user exists
if ! id -u $admin_name > /dev/null 2>&1; then

# Create the user that will be used for administrate this server.
#
echo "Creating the admin accoun $admin_name"
echo
sleep 1
if adduser --help | grep -e "--gecos" > /dev/null; then

  adduser --disabled-password --gecos "" $admin_name > /dev/null;

elif adduser --help | grep -e "--comment" > /dev/null; then
 
  adduser --disabled-password --comment "" $admin_name > /dev/null;

else
  adduser --disabled-password $admin_name
fi
echo
chpasswd <<<"$admin_name:$admin_password"

# Set privileges for the admin account.
#
echo "Set privileges for the admin account"
usermod -aG sudo $admin_name
echo
sleep 1

# Enabling SSH access for the admin user by copying roots ssh dir to the new admin user
#
echo "Enabling SSH access for the admin user"
rsync --archive --chown="$admin_name:$admin_name" ~/.ssh "/home/$admin_name"
echo
sleep 1

else 

echo "Admin account already exists. Continuing..."
sleep 1

fi

# Enables and configures the firewall.
# This step is skipped under macOS.
#
if command -v ufw > /dev/null; then

  ufw default deny incoming
  echo
  ufw default allow outgoing
  echo
  ufw allow OpenSSH
  echo
  yes | sudo ufw enable
  echo
  echo "Enabled ufw"
  echo
  sleep 1

elif ! [ "$(uname -s)" = "Darwin" ]; then
  echo "No firewall detected and not on macOS. Exiting."
  sleep 1
  exit 1
fi
