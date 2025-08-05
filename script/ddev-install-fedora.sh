#!/usr/bin/env bash
# How to use:
# - chmod +x ddev-install-fedora.sh
# - ./ddev-install-fedora.sh
# https://docs.docker.com/engine/install/fedora/

# install docker on fedora
sudo dnf -y install dnf-plugins-core
# add docker releases to your package repository
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
# install docker
sudo dnf install dnf-plugins-core docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
#sudo groupadd docker
sudo usermod -aG docker $USER
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
sudo systemctl enable --now docker
sudo systemctl start docker

# https://ddev.readthedocs.io/en/stable/users/install/ddev-installation/
# install ddev on fedora
# add ddev releases to your package repository
sudo sh -c 'echo ""'
echo '[ddev]
name=ddev
baseurl=https://pkg.ddev.com/yum/
gpgcheck=0
enabled=1' | perl -p -e 's/^ +//' | sudo tee /etc/yum.repos.d/ddev.repo >/dev/null
# install ddev
sudo sh -c 'echo ""'
sudo dnf install --refresh ddev -y
# one-time initialization of mkcert
mkcert -install
sudo systemctl restart docker
