# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # CentOS base image, 40 GB disk storage
  #config.vm.box = "chef/centos-6.6"
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = true

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  
  config.vm.hostname = "flowbox"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "10.0.0.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Forwarded ports
  config.vm.network "forwarded_port", guest: 22, host: 2022, id: "ssh"
  config.vm.network "forwarded_port", guest: 80, host: 8080, id: "http"
  config.vm.network "forwarded_port", guest: 8000, host: 8000, id: "node"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "provisioning/", "/var/vagrant/provisioning",
    owner: "vagrant",
    group: "vagrant",
    mount_options: [ "dmode=775,fmode=775" ]

  # Disable default shared folder
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Provider-specific configuration
  config.vm.provider "virtualbox" do |vb|
    vb.name = "Flowbox"
    vb.gui = false
    vb.memory = "4096"
    vb.cpus = 4
    vb.customize [ "modifyvm", :id, "--vram", "32" ]
  end

  # Shell provisioning
  config.vm.provision "shell", inline: <<-SHELL
    #sudo su
    #yum -y update

    #yum -y install dos2unix
    #dos2unix /var/vagrant/provisioning/*

    #cd /var/vagrant/provisioning

    exit
  SHELL
end
