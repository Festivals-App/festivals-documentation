# Creating Virtual Machines

Virtual machines (VMs) are a powerful way to run multiple operating systems on a single machine, create isolated environments for testing, or manage workloads efficiently. There are various methods to create and manage VMs, depending on individual needs.

In this guide, I will focus on two popular approaches: Proxmox, an open-source platform for managing VMs and containers on your own hardware, and DigitalOcean, a cloud-based service that simplifies VM deployment. While these are the main focus, other solutions like VMware ESXi, VirtualBox, and Microsoft Hyper-V are also widely used and worth mentioning.

![DigitalOcean](https://img.shields.io/badge/DigitalOcean-%230167ff.svg?style=for-the-badge&logo=digitalOcean&logoColor=white)
![Proxmox](https://img.shields.io/badge/proxmox-proxmox?style=for-the-badge&logo=proxmox&logoColor=%23E57000&labelColor=%232b2a33&color=%232b2a33)

## Initialise an Ubuntuu VM

I use Ubuntu Server LTS as the operating system for the virtual machine due to its stability, long-term support, and broad compatibility. While other Linux distributions like Debian, CentOS, AlmaLinux, or Arch Linux can also be used, ***it's important to note that the FestivalsApp backend and scripts have not been tested on distributions other than Ubuntu Server LTS. Using a different distribution may require adjustments or troubleshooting to ensure compatibility.***

After you created a VM int Proxmox ([how-to](https://support.us.ovhcloud.com/hc/en-us/articles/360010916620-How-to-Create-a-VM-in-Proxmox-VE)) or created a new Droplet on Digitalocean [how-to](https://docs.digitalocean.com/products/droplets/how-to/create/) 
https://ubuntu.com/tutorials/install-ubuntu-server#1-overview

### vm-init.sh

The `vm-init.sh` script will check if the specified admin user exists and create it if necessary. It will also enable the UFW firewall and configure it to allow SSH connections.

```bash
curl -o vm-init.sh https://raw.githubusercontent.com/Festivals-App/festivals-documentation/main/deployment/vm-deployment/vm-init.sh
chmod +x vm-init.sh
sudo ./vm-init.sh <admin_name> <admin_password>
```

### Setup SSH access

See [ssh-setup](./ssh-setup.md) for SSH setup in general.
