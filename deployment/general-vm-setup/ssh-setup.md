# VM Setup: Creating SSH Keys

### Setup

Generate a SSH key pair:
```bash
ssh-keygen -t rsa
```

- SSH key name scheme: `id_rsa_<projectname>_<vm-name>`
- Password length: `25 Characters`

### Usage

Add or edit a simple `config` text file in `~/.ssh`:
```bash
Host *
  AddKeysToAgent yes
  UseKeychain yes

Host <IP address or hostname>
  IdentityFile ~/.ssh/<id_rsa_....>
```

Login with:
 `ssh root@<IP address or hostname>`

### Digital Ocean Setup

Following this guide: https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-2
