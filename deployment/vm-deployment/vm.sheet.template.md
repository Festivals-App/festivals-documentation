# vm.sheet.template

## SSH Keys

Name:                   `ssh key in ~/.ssh`
Password:               `password`

## VM Info

Name:                   `name of the vm`
IP4:                    `ip address`
IP6:                    - na -

Private IP:             `private ip address`
Private Mask:           - na -

Username:               `username`
Password:               `password`
Service-Key:            `service key`

### Usefull Commands

#### General

```bash
sudo apt update                             // update package index
sudo apt upgrade                            // upgrade packages
sudo apt --with-new-pkgs upgrade <list>     // force upgrade packages
sudo apt autoremove                         // clean up package management
sudo reboot                                 // reboot
top                                         // displays system resources
sudo netstat -plunt                         // check listen ports
systemctl status <service>                  // Check service status
```

#### UFW

```bash
sudo ufw status numbered                    // check firewall status
sudo ufw status delete `index`              // delete rule with the given index
```

### Logs

```bash
last                                        // listing the last logged in users
sudo cat /var/log/auth.log                  // authentication log
sudo cat /var/log/mail.log                  // sendmail log
```

## Resources

### DigitalOcean Ressources

- Access Guide: <https://digitalocean.com/community/tutorials/how-to-set-up-an-ubuntu-20-04-server-on-a-digitalocean-droplet>
- Initial Setup Guide: <https://digitalocean.com/docs/droplets/tutorials/recommended-setup/>
- Setup Server&SSH: <https://digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04>
- Setup MYSQL: <https://digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04>
- Setup Remote DB access: <https://digitalocean.com/community/tutorials/how-to-set-up-a-remote-database-to-optimize-site-performance-with-mysql-on-ubuntu-18-04>
- Setup Systemd Unit File (service): <https://digitalocean.com/community/tutorials/how-to-deploy-a-go-web-application-using-nginx-on-ubuntu-18-04>

## Notes
