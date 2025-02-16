# Creating Virtual Machines

Virtual machines (VMs) are a powerful way to run multiple operating systems on a single machine, create isolated environments for testing, or manage workloads efficiently and they form the foundation of all **FestivalsApp** microservices.

In this guide, I will focus on two popular approaches: Proxmox (PVE), an open-source platform for managing VMs and containers on your own hardware, and DigitalOcean (DO), a cloud-based service that simplifies VM deployment. While these are the main focus, other solutions like VMware ESXi, VirtualBox, and Microsoft Hyper-V are also widely used and worth mentioning.

![DigitalOcean](https://img.shields.io/badge/DigitalOcean-%230167ff.svg?style=for-the-badge&logo=digitalOcean&logoColor=white)
![Proxmox](https://img.shields.io/badge/proxmox-proxmox?style=for-the-badge&logo=proxmox&logoColor=%23E57000&labelColor=%232b2a33&color=%232b2a33)

## Initialise an Ubuntuu VM with Proxmox or DigitalOcean

I use Ubuntu Server 24.04 LTS as the operating system for the virtual machine due to its stability, long-term support, and broad compatibility. While other Linux distributions like Debian, CentOS, AlmaLinux, or Arch Linux can also be used.

**It's important to note that the FestivalsApp backend and scripts have not been tested on distributions other than Ubuntu. Using a different distribution may require adjustments or troubleshooting to ensure compatibility.**

Both Proxmox and DigitalOcean offer multiple methods for creating a VM. If you're using Proxmox, I recommend **cloud-init** for automated setup ([YouTube guide](https://www.youtube.com/watch?v=ke6MYhI8qDE)). For DigitalOcean, I use **Droplets** for quick and easy deployment ([official guide](https://docs.digitalocean.com/products/droplets/how-to/create/)).

### Adding SSH Keys

Using SSH keys for authentication enhances security and simplifies access to virtual machines. Both DigitalOcean and Proxmox support multiple methods for adding SSH keys.

#### Proxmox

1. Injecting SSH Keys into a Cloud-Init Template
   - When using cloud-init for automated deployments, specify SSH keys in the VM template settings under `Cloud-Init → SSH public key`.

2. Manually Adding an SSH Key
   - Append your public key to the `~/.ssh/authorized_keys` file.

#### DigitalOcean

1. Adding SSH Keys via the Web Interface
   - When creating a new droplet, you can add an SSH key directly in the "Authentication" section.
   - Pre-existing keys can be managed under `Settings → Security → SSH Keys`.  

2. Adding SSH Keys via the API  
   - Use the DigitalOcean API to programmatically add keys.  
   - The `doctl` command-line tool allows adding keys with:

     ```bash
     doctl compute ssh-key import "key-name" --public-key-file ~/.ssh/id_rsa.pub
     ```  

3. Manually Adding an SSH Key
   - Once the droplet is created, manually append your public key to the `~/.ssh/authorized_keys` file.

Depending on how the VM was created, you should now be logged in as the **root user**, either via SSH or through the web consoles provided by Proxmox and DigitalOcean.  

### vm-init.sh

I configure all VMs to have both the root user and an admin user with password login disabled but remote login enabled. To simplify this process, you should run the `vm-init.sh` script, which:

- Ensures the specified admin user exists (creates it if necessary).
- Enables the UFW firewall and configures it to allow SSH connections.

```bash
curl -o vm-init.sh https://raw.githubusercontent.com/Festivals-App/festivals-documentation/main/deployment/vm-deployment/vm-init.sh
chmod +x vm-init.sh
sudo ./vm-init.sh <admin_name> <admin_password>
```

Now you should be able to login with the newly created **admin user** via ssh. I compiled some general help on ssh setup and ssh usage [here](./ssh-setup.md) based on what i do.

### Securing the SSH settings

After verifying that SSH login works and you have sudo privileges, disable password authentication and enhance the SSH configuration for improved security:

```bash
## Create a new config file
sudo nano /etc/ssh/sshd_config.d/00-festivals-cloudimg-settings.conf

## Add the following settings
PermitRootLogin prohibit-password
StrictModes yes
PubkeyAuthentication yes
HostbasedAuthentication no
PasswordAuthentication no
PermitEmptyPasswords no
ChallengeResponseAuthentication no

# Check the SSH configuration
sudo sshd -T
# Restart the SSH service
sudo systemctl restart ssh.service
# Test if password login is disabled (this should fail)
ssh -o PubkeyAuthentication=no -o PreferredAuthentications=password <username>@<IP address or hostname>
```

## Resources

SSH keys DO guide: <https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-20-04>
Security best practices (german): <https://blog.buettner.xyz/sichere-ssh-konfiguration/>
Security best practices by ssh.com: <https://www.ssh.com/academy/ssh/sshd_config>
