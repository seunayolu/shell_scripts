# Install AWS CLI 
#!/bin/bash
set -eux

# Convert HTTP to HTTPS in sources file
sudo sed -i 's|http://|https://|g' /etc/apt/sources.list.d/ubuntu.sources

# Update package lists
apt-get update -y
sudo apt install unzip -y
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install

curl -s https://api.github.com/meta | jq -r '.hooks[]'

aws ssm start-session --target i-00b65c82b22363a1c --document-name AWS-StartInteractiveCommand --parameters command="bash"

kubectl delete crd applications.argoproj.io
kubectl delete crd applicationsets.argoproj.io
kubectl delete crd appprojects.argoproj.io