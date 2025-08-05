![logo](../assets/logo.png)

##### [← Back to overview](../README.md)

[DDEV-Docs](https://ddev.readthedocs.io/)

Install
==============================
### install docker on fedora 
you can use the ddev-install-fedora.sh script or manually 

## Script
```
chmod +x ddev-install-fedora.sh
./ddev-install-fedora.sh
```

## Manually
https://docs.docker.com/engine/install/fedora/

#### add docker releases to your package repository
```
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
```
#### install docker
```
sudo dnf install dnf-plugins-core docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

```
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable --now docker
sudo systemctl start docker
```

### install ddev on fedora 
https://ddev.readthedocs.io/en/stable/users/install/ddev-installation/
#### add ddev releases to your package repository
```
sudo sh -c 'echo ""'
echo '[ddev]
name=ddev
baseurl=https://pkg.ddev.com/yum/
gpgcheck=0
enabled=1' | perl -p -e 's/^ +//' | sudo tee /etc/yum.repos.d/ddev.repo >/dev/null
```
#### install ddev
```
sudo dnf install --refresh ddev
```
#### one-time initialization of mkcert
```
mkcert -install
```
# reboot your system!


