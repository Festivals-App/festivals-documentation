# General VM Setup

### Initialise a vanilla VM

To initialise a vanilla VM (the like you will get as a DigitalOcean droplet) if you are logged in 
as root user and there isn't an admin user to use for day-to-day admin work:
```bash
curl -o vm-init.sh https://raw.githubusercontent.com/Festivals-App/festivals-documentation/main/deployment/vm-deployment/vm-init.sh
chmod +x vm-init.sh
sudo ./vm-init.sh <admin_name> <admin_password>
```
Then exit and login as the newly created admin user.

### Setup SSH access

See [ssh-setup](./ssh-setup.md) for SSH setup in general.