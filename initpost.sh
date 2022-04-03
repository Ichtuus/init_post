#!/bin/sh
cd ~ 

echo "Instaltation of zsh"
sudo apt install zsh

echo "Instaltation of ohmyzsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Enable zsh by default"
chsh -s $(which zsh)
source ~/.zshrc

echo "Initialization of vscode intall process"
echo "Update the packages index and install the dependencies"
sudo apt update
sudo apt install software-properties-common apt-transport-https wget

echo "Import the Microsoft GPG key"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

echo "Enable the Visual Studio Code repository"
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

echo "Installation of the Visual Studio Code package"
sudo apt install code

echo "Upgrade the package index"
sudo apt update
sudo apt upgrade