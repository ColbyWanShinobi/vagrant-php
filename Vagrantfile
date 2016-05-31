# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #config.vbguest.auto_update = false
  config.vm.define "Vagrant Local PHP"
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: '192.168.187.101'
  config.vm.synced_folder ".", "/shared"
  #/var/www/html
  config.ssh.insert_key = false
  config.vm.provision :shell, path: "provision.sh"
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    v.customize ["modifyvm", :id, "--memory", "512"]
    v.customize ["modifyvm", :id, "--cpus", "1"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/shared", "1"]
    v.gui = false
  end

end




# # -*- mode: ruby -*-
# # vi: set ft=ruby :
#
# #Don't change this unless you know what you are doing
# VAGRANTFILE_API_VERSION = "2"
#
# Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
#   #This is the name of the server that you see in all the status messages during the "up" process
#   config.vm.define = "Vagrant Local PHP"
#
#   #This is the name of the "box" or base image we're basing our server on
#   config.vm.box = "ubuntu/trusty64"
#
#   #Private network because we don't want traffic from outside our host OS
#   #config.vm.network "private_network", ip: "192.168.26.12"
#   #config.vm.network "public_network"
#   config.vm.network "private_network", type: "dhcp"
#
#   #
#   config.vm.synced_folder ".", "/webigail"
#
#   #
#   config.ssh.insert_key = false
#
#   #Execute this script to begin the provisioning process. This script should be in the same directory as this file.
#   config.vm.provision "shell", path: "provision.sh"
#
#   config.vm.provider "virtualbox" do |vb|
#     #I do not want to see the VirtualBox GUI every time I start this machine
#     vb.gui = false
#
#     #This is the name of the VM as seen in the VirtualBox GUI
#     vb.name = "Local PHP (vagrant)"
#
#     #This is the amount of RAM you want your virtual server to have
#     #Note! The server will run with 1GB of ram but I was unable to compile the code with less than 2GB of RAM.
#     vb.memory = "512"
#
#     #This is the number of CPUs you want your server to have
#     vb.cpus = "1"
#
#     #Attempt to fix symlinks not working in Windows shares
#     vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/edocr", "1"]
#   end
# end
