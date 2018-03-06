# -*- mode: ruby -*-
# vi: set ft=ruby :

# Shell provisioning during first-time setup
$provisioning = <<-PROVISIONING
  sudo yum update -y
PROVISIONING

Vagrant.configure(2) do |config|

  # CentOS 7 base image, 40 GB disk storage
  config.vm.box = "lightbase-vmware.box"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  # Virtual machine hostname
  config.vm.hostname = "lightbox"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", type: "dhcp"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Forwarded ports
  config.vm.network "forwarded_port", guest: 22, host: 2022, id: "ssh"
  config.vm.network "forwarded_port", guest: 8080, host: 8080, id: "static"
  config.vm.network "forwarded_port", guest: 8000, host: 8000, id: "http"
  config.vm.network "forwarded_port", guest: 8001, host: 8001, id: "https"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "projects/", "/var/projects",
    owner: "vagrant",
    group: "vagrant",
    mount_options: [ "dmode=777,fmode=777" ]
    
  config.vm.synced_folder "sites/", "/var/sites",
    owner: "vagrant",
    group: "apache",
    mount_options: [ "dmode=777,fmode=777" ]
    
  config.vm.synced_folder "data/", "/var/data",
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

  # Shell provisioning
  config.vm.provision "shell",
    inline: $provisioning,
    privileged: false
    
  # Docker provisioning
  config.vm.provision "docker" do |docker|
    #docker.pull_images "image:version"
  end  
end
