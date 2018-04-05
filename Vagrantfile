# -*- mode: ruby -*-
# vi: set ft=ruby :

# --------------------------
# Vagrant Configuration File
# Ubuntu 17.10
# --------------------------
#
# Ralph Wiedemeier <ralph@framefactory.ch>
# (c) 2018 Frame Factory GmbH

# Shell provisioning during first-time setup
$provisioning = <<-PROVISIONING
  apt-get update && apt-get upgrade -y
  apt-get install -y dos2unix
  dos2unix /var/provisioning/*.sh
  pushd /var/provisioning
  bash ubuntu-base.sh
  bash ubuntu-samba.sh
  bash ubuntu-node.sh
  bash ubuntu-caddy.sh
  bash ubuntu-aliases.sh
PROVISIONING

Vagrant.configure("2") do |config|

  # Base Vagrant box
  config.vm.box = "ubuntu/xenial64"

  # Disable automatic box update checking (not recommended).
  # config.vm.box_check_update = false

  # Virtual machine hostname
  config.vm.hostname = "midas"

  # Create a private or public network.
  config.vm.network "public_network", ip: "192.168.1.200"
  # config.vm.network "private_network", type: "dhcp"

  # Forwarded ports
  config.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh"

  # Shared folders: host path to actual folder, guest path to mount point.
  config.vm.synced_folder "shared/", "/var/shared",
    owner: "vagrant",
    group: "vagrant",
    mount_options: [ "dmode=777,fmode=777" ]
    
  config.vm.synced_folder "provisioning/", "/var/provisioning",
    owner: "vagrant",
    group: "vagrant",
    mount_options: [ "dmode=777,fmode=777" ]
    
  # Disable default shared folder
  config.vm.synced_folder ".", "/vagrant",
    disabled: true
  
  # Provider-specific configuration
  config.vm.provider "vmware-fusion" do |vb|
    vb.name = "Lightbox"
    vb.gui = false
    vb.memory = "2048"
    vb.cpus = 2
  end

  config.vm.provider "virtualbox" do |vb|
    vb.name = "Lightbox"
    vb.gui = false
    vb.memory = "2048"
    vb.cpus = 2
  end

  # Shell provisioning
  config.vm.provision "shell",
    inline: $provisioning,
    privileged: true

  # Docker provisioning
  config.vm.provision "docker" do |docker|
    #docker.pull_images "image:version"
  end 
end
