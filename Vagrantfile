# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.box_check_update = false
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--vram", 16]
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.gui = false
  end

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network :private_network, ip: "33.33.33.10"
  config.vm.hostname = "user.dev"
  config.hostsupdater.aliases = [
    "user.dev",
    "sample.user.dev",
  ]

  config.vm.provision "shell", inline: <<-SHELL
    /vagrant/init.sh
  SHELL
end
