# General VM Setup: SSH Access

### Setup

Generate a SSH key pair on client machine:
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

Copy public key to server:
`ssh-copy-id -i ~/.ssh/<key.pub> <username>@<IP address or hostname>`

Login with:
 `ssh <username>@<IP address or hostname>`

For development it is okay to use one key pair for all development server, see [best-practice](https://security.stackexchange.com/questions/40050/best-practice-separate-ssh-key-per-host-and-user-vs-one-ssh-key-for-all-hos) discussion on stackexchange.

### Digital Ocean Setup

Following this guide: https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-2
