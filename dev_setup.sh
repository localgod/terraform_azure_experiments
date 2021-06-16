#!/usr/bin/env bash
export TF_CLI_VERSION=1.0.0
wget https://releases.hashicorp.com/terraform/${TF_CLI_VERSION}/terraform_${TF_CLI_VERSION}_linux_amd64.zip
sudo unzip -o terraform_${TF_CLI_VERSION}_linux_amd64.zip -d /usr/bin/
sudo chmod 755 /usr/bin/terraform
rm terraform_${TF_CLI_VERSION}_linux_amd64.zip
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-get update
sudo apt-get install azure-functions-core-tools-3
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
curl https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update;   sudo apt-get install -y apt-transport-https &&   sudo apt-get update &&   sudo apt-get install -y dotnet-sdk-3.1
rm packages-microsoft-prod.deb
cd ./terraform
terraform init -backend-config="token=${TF_API_TOKEN}"
cd ..