# -*- mode: ruby -*-
# vi: set ft=ruby :

# --------------------------
# Vagrant Configuration File
# Ubuntu 18.04
# --------------------------
#
# Ralph Wiedemeier <ralph@framefactory.ch>
# (c) 2018 Frame Factory GmbH

# Shell provisioning during first-time setup
$provisioning_root = <<-PROVISIONING
  apt-get update
  apt-get install -y dos2unix
  dos2unix /var/provisioning/*.sh
  pushd /var/provisioning
  bash ubuntu-base.sh
  bash ubuntu-samba.sh
  bash ubuntu-node.sh
  popd
PROVISIONING

$provisioning_vagrant = <<-PROVISIONING
  pushd /var/provisioning
  bash ubuntu-docker.sh
  bash ubuntu-caddy.sh
  bash ubuntu-customize.sh
  popd
PROVISIONING

Vagrant.configure("2") do |config|

  # Base Vagrant box
  config.vm.box = "generic/ubuntu1804"
  config.disksize.size = "32GB"

  # Disable automatic box update checking (not recommended).
  # config.vm.box_check_update = false

  # Virtual machine hostname
  config.vm.hostname = "midas"

  # Create a private or public network.
  config.vm.network "private_network", ip: "10.0.0.10"
  # config.vm.network "public_network", type: "dhcp"

  # Forwarded ports
  #config.vm.network "forwarded_port", guest: 22, host: 22, id: "ssh"
  #config.vm.network "forwarded_port", guest: 8000, host: 8000
  #config.vm.network "forwarded_port", guest: 8001, host: 8001

  # Shared folders: host path to actual folder, guest path to mount point.
  #config.vm.synced_folder "shared/", "/var/shared",
  #  owner: "vagrant",
  #  group: "vagrant",
  #  mount_options: [ "dmode=777,fmode=777" ]
    
  config.vm.synced_folder "provisioning/", "/var/provisioning",
    owner: "vagrant",
    group: "vagrant",
    mount_options: [ "dmode=777,fmode=777" ]
    
  # Disable default shared folder
  config.vm.synced_folder ".", "/vagrant",
    disabled: true
  
  # Provider-specific configuration
  config.vm.provider "vmware-fusion" do |vb|
    vb.name = "Midas"
    vb.gui = false
    vb.memory = "2048"
    vb.cpus = 2
  end

  config.vm.provider "virtualbox" do |vb|
    vb.name = "Midas"
    vb.gui = false
    vb.memory = "2048"
    vb.cpus = 2
  end

  config.vm.provider "hyperv" do |hv|
    hv.vmname = "Midas"
    hv.gui = false
    hv.memory = "2048"
    hv.cpus = 2

  # Shell provisioning (as root)
  config.vm.provision "shell",
    inline: $provisioning_root,
    privileged: true

  # Docker provisioning
  config.vm.provision "docker" do |docker|
    #docker.pull_images "image:version"
  end 

  # Shell provisioning (as vagrant)
  config.vm.provision "shell",
    inline: $provisioning_vagrant,
    privileged: false
end
