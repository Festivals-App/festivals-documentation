# General SSH Setup

This document is a collection of tips and snippets that i find helpful when i setup and manage SSH access to my VMs in development and production.

I use different SSH keys for different tasks, for development it is okay to use one key pair for all development server, see
[best-practice](https://security.stackexchange.com/questions/40050/best-practice-separate-ssh-key-per-host-and-user-vs-one-ssh-key-for-all-hos)
discussion on stackexchange so i use one SSH key for the Proxmox host, one SSH key for all my Proxmox VMs but i use one SSH key for each production server and user.

## SSH key pair creation

Generate a SSH key pair on client machine:
`ssh-keygen -t rsa`

- SSH key name scheme: `id_rsa_<projectname>_<node-name>`
- Password length: `25 Characters`
    Generating a password via the terminal: `openssl rand -base64 35 | tr -d "=+/" | cut -c1-25`

Copy public key to server you want to login remotely:
`ssh-copy-id -i ~/.ssh/<key.pub> <username>@<IP address or hostname>`

## Usage tips on macOS

Add or edit a simple `config` text file in `~/.ssh` to use the right key for a given host:

```bash
Host *
  AddKeysToAgent yes
  UseKeychain yes

Host <IP address or hostname>
  IdentityFile ~/.ssh/<id_rsa_....>
```

Now you can login with `ssh <username>@<IP address or hostname>` rather than using `ssh -i <private key filename> <username>@<IP address or hostname>`
