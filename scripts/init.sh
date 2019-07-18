#!/bin/bash -eux

# Add vagrant user to sudoers.
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Disable daily apt unattended updates.
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic

sudo apt update
sudo apt upgrade -y

sudo apt install -y git

# Make sure we are in home folder
cd $HOME

git clone https://github.com/vukmark/vukmark-bin.git

cd $HOME/vukmark-bin/bin

chmod +x ./*

./setup_config.sh

cd $HOME

source .profile

install_common_software.sh
install_lamp.sh
install_composer.sh
