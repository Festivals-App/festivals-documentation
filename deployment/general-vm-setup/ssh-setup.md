# General VM Setup: SSH Access

With DigitalOcean (and other hosters) you are able to add you ssh key to the newly created vm 
and you are pretty much ready to ssh into the server securely without using password authentication 
for environments without that feature you can do that manually.

### SSH key pair creation

Generate a SSH key pair on client machine:
`ssh-keygen -t rsa`

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

For development it is okay to use one key pair for all development server, 
see [best-practice](https://security.stackexchange.com/questions/40050/best-practice-separate-ssh-key-per-host-and-user-vs-one-ssh-key-for-all-hos) discussion on stackexchange.

## Securing the server

After making sure you can login via public key disable password authentication on the server by editing the `sshd_config`:
```bash
sudo nano /etc/ssh/sshd_config
```

and change the necessary values:

`PermitRootLogin yes` to `PermitRootLogin prohibit-password`

`StrictModes no` to `StrictModes yes`

`PubkeyAuthentication no` to `PubkeyAuthentication yes`

`HostbasedAuthentication yes` to `HostbasedAuthentication no`

`PasswordAuthentication yes` to `PasswordAuthentication no`

`PermitEmptyPasswords yes` to `PermitEmptyPasswords no`

`ChallengeResponseAuthentication yes` to `ChallengeResponseAuthentication no`

### Digital Ocean Setup

Following this guide: https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-20-04
Security best practices (german): https://blog.buettner.xyz/sichere-ssh-konfiguration/