# General VM Setup

To initialise a blank VM if you are logged in as root user:
```bash
curl -o vm-init.sh https://raw.githubusercontent.com/Festivals-App/festivals-documentation/master/deployment/general-vm-setup/vm-init.sh
chmod +x vm-init.sh
sudo ./vm-init.sh <admin_name> <admin_password>

```
