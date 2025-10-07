#!/bin/bash

sleep 60

set -eux

# Convert HTTP to HTTPS in sources file
sudo sed -i 's|http://|https://|g' /etc/apt/sources.list.d/ubuntu.sources

# update package repos
sudo apt-get update -y

# Add Docker's official GPG key:
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add ubuntu users to docker group
sudo usermod -aG docker ubuntu

# Install AWS CLI 
sudo apt-get install unzip -y
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install gitLab runner
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
sudo apt-get install gitlab-runner -y

# Register GitLab Runner
sudo gitlab-runner register \
  --non-interactive \
  --url "https://gitlab.com/" \
  --token "glrt-rCoSuCJ-E-6knmtlyeR5LG86MQpwOjE3NTFqMwp0OjMKdTphd3doahg.01.1j1u0nuro" \
  --executor docker \
  --docker-image docker:28.3.3 

# Path to your GitLab Runner config file
CONFIG_FILE="/etc/gitlab-runner/config.toml"

# Modify the config.toml to set privileged mode and append to volumes
sudo sed -i '/^\s*\[runners.docker\]/,/^\s*\[/{ 
    s/^\(\s*privileged\s*=\s*\).*$/\1true/
    /volumes = \[/ s/\]$/,"\/var\/run\/docker.sock:\/var\/run\/docker.sock"]/
}' "$CONFIG_FILE"

# Start docker to apply the above change
sudo usermod -aG docker gitlab-runner
sudo systemctl restart docker
sudo systemctl restart gitlab-runner