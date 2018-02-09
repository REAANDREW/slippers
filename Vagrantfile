# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.ssh.forward_agent = true
  config.ssh.insert_key = false

  config.vm.provision :shell, inline: 'DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade'

  config.vm.provision "ansible" do |ansible|
     ansible.playbook = "ansible/playbook.yml"
  end

  config.vm.provider 'virtualbox' do |vb|
    vb.name = "devenv_base"
    vb.gui = false
  
    # Customize the amount of memory on the VM:
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
  end

end
