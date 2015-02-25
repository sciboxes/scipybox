# -*- mode: ruby -*-
# vi: set ft=ruby :

LAB_DIR = ENV["LAB_DIR"] || "lab/"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  
  config.vm.provider "virtualbox" do |vb|
    vb.name = "scipybox"
    vb.customize ["modifyvm", :id, "--memory", 2048]
  end

  config.vm.network "private_network", type: "dhcp"
  config.ssh.forward_agent = true
  config.vm.synced_folder LAB_DIR, "/home/vagrant/lab/"

  # speed up provisioning by enabling caching
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.synced_folder "salt/roots/", "/srv/"
  config.vm.provision :salt do |salt|
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
    salt.verbose = true
    salt.colorize = true
  end

end
