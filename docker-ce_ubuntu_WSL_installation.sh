#!/bin/sh

# updating
sudo apt update

# installing prerequisite-packages which let apt use packages over HTTPS:
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# adding the GPG key for the official Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# adding the Docker repository to APT sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# updating
sudo apt update

# running the command to make sure you are about to install from the Docker repo instead of the default Ubuntu repo
apt-cache policy docker-ce

# installing modules
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Adding current user to docker group
sudo usermod -aG docker ${USER}

# starting and enabling docker-ce service
sudo service docker start
sudo service docker enable

# To apply groupmembership without log-out running the following command
echo "To Apply Docker Group-membership, please enter your password"
su - ${USER}

