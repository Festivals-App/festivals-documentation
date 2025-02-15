# Creating Virtual Machines

Virtual machines (VMs) are a powerful way to run multiple operating systems on a single machine, create isolated environments for testing, or manage workloads efficiently and are the basis of all festivalsapp microservices. There are various methods to create and manage VMs, depending on individual needs.

In this guide, I will focus on two popular approaches: Proxmox, an open-source platform for managing VMs and containers on your own hardware, and DigitalOcean, a cloud-based service that simplifies VM deployment. While these are the main focus, other solutions like VMware ESXi, VirtualBox, and Microsoft Hyper-V are also widely used and worth mentioning.

![DigitalOcean](https://img.shields.io/badge/DigitalOcean-%230167ff.svg?style=for-the-badge&logo=digitalOcean&logoColor=white)
![Proxmox](https://img.shields.io/badge/proxmox-proxmox?style=for-the-badge&logo=proxmox&logoColor=%23E57000&labelColor=%232b2a33&color=%232b2a33)

## Initialise an Ubuntuu VM

I use Ubuntu Server LTS as the operating system for the virtual machine due to its stability, long-term support, and broad compatibility. While other Linux distributions like Debian, CentOS, AlmaLinux, or Arch Linux can also be used.

**It's important to note that the FestivalsApp backend and scripts have not been tested on distributions other than Ubuntu Server LTS. Using a different distribution may require adjustments or troubleshooting to ensure compatibility.**

After you created a VM int Proxmox ([how-to](https://support.us.ovhcloud.com/hc/en-us/articles/360010916620-How-to-Create-a-VM-in-Proxmox-VE)) or created a new Droplet on Digitalocean [how-to](https://docs.digitalocean.com/products/droplets/how-to/create/)

### vm-init.sh

The `vm-init.sh` script will check if the specified admin user exists and create it if necessary. It will also enable the UFW firewall and configure it to allow SSH connections.

```bash
curl -o vm-init.sh https://raw.githubusercontent.com/Festivals-App/festivals-documentation/main/deployment/vm-deployment/vm-init.sh
chmod +x vm-init.sh
sudo ./vm-init.sh <admin_name> <admin_password>
```

# **Adding SSH Keys in DigitalOcean and Proxmox**  

Using SSH keys for authentication enhances security and simplifies access to virtual machines. Both **DigitalOcean (DO)** and **Proxmox Virtual Environment (PVE)** support multiple methods for adding SSH keys.  

### DigitalOcean

1. **Adding SSH Keys via the Web Interface**  
   - When creating a new droplet, you can add an SSH key directly in the "Authentication" section.  
   - Pre-existing keys can be managed under **Settings → Security → SSH Keys**.  

2. **Adding SSH Keys via the API or CLI**  
   - Use the DigitalOcean API to programmatically add keys.  
   - The `doctl` command-line tool allows adding keys with:

     ```sh
     doctl compute ssh-key import "key-name" --public-key-file ~/.ssh/id_rsa.pub
     ```  

3. **Manually Adding an SSH Key After Deployment**  
   - Once the droplet is created, SSH into it using the root password and manually add your key to `~/.ssh/authorized_keys`.  

### Proxmox (PVE)

1. **Adding SSH Keys via the Web Interface**  
   - In Proxmox, navigate to **Datacenter → Users**, select a user, and add the SSH key under **SSH Public Key**.  

2. **Injecting SSH Keys into a Cloud-Init Template**  
   - When using cloud-init for automated deployments, specify SSH keys in the VM template settings under **Cloud-Init → SSH Keys**.  

3. **Manually Adding an SSH Key to a VM**  
   - SSH into the Proxmox host or VM and append the key to `~/.ssh/authorized_keys`.  
   - Example command:  

    ```sh
    echo "your-public-key" >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys
     ```  

Each method offers different levels of automation and convenience, depending on the use case.
