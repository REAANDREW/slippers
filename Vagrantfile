# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  #config.vm.box = "slippers-golang-ubuntu-16.10"
  config.vm.box = "ubuntu/trusty64"
  config.ssh.forward_agent = true
  config.vm.network       "private_network", ip: "192.168.99.45"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 9000, host: 9000
  config.vm.network "forwarded_port", guest: 9002, host: 9002
  config.vm.network "forwarded_port", guest: 9200, host: 9200
  config.vm.network "forwarded_port", guest: 5601, host: 5601
  config.vm.network "forwarded_port", guest: 5000, host: 5000
  config.vm.network "forwarded_port", guest: 5044, host: 5044
  config.vm.network "forwarded_port", guest: 4567, host: 4567
  config.vm.network "forwarded_port", guest: 15672, host: 15672
  config.vm.network "forwarded_port", guest: 35000, host: 35000
  config.vm.network "forwarded_port", guest: 9091, host: 9091
  config.vm.network "forwarded_port", guest: 9090, host: 9090
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"


  config.vm.provision :shell, inline: "sudo apt-get -y install python-simplejson"

  config.vm.provision "ansible_local" do |ansible|
     ansible.playbook = "ansible/playbook.yml"
     #ansible.galaxy_role_file = "ansible/galaxy-roles.yml"
  end

  config.vm.provider 'virtualbox' do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
  
    # Customize the amount of memory on the VM:
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.memory = "8092"
    vb.cpus = 2
    vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000 ]
  end

end
