# General VM Setup

See [ssh-setup](./ssh-setup-md) for SSH setup in general.

### Initialise a fresh VM
To initialise a fresh VM if you are logged in as root user:
```bash
curl -o vm-init.sh https://raw.githubusercontent.com/Festivals-App/festivals-documentation/master/deployment/general-vm-setup/vm-init.sh
chmod +x vm-init.sh
sudo ./vm-init.sh <admin_name> <admin_password>

```
