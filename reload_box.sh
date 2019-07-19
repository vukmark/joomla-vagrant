#!/bin/bash

# make sure we are in current directory
cd "$(dirname "$0")"

packer build packer.json

vagrant destroy -f
vagrant box remove vukmark/joomla-vagrant

# Todo get version box from variable or read from file
vagrant box add --name vukmark/joomla-vagrant output/vukmark-joomla-vagrant.0.0.1.box

rm -f Vagrantfile

vagrant init vukmark/joomla-vagrant
vagrant up
