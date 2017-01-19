# -*- mode: ruby -*-
# vi: set ft=ruby :
#
#

Vagrant.configure(2) do |config|
    config.vm.box           = "ubuntu/trusty64"
    config.vm.network       "private_network", ip: "192.168.56.9"
    config.ssh.forward_agent = true

    config.vm.provision :ansible do |ansible|
        ansible.playbook = "playbook.yml"
    end

    config.vm.provider :virtualbox do |vb|
        vb.name = "base-dev-env"
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.customize ["modifyvm", :id, "--memory", "4096"]
        vb.customize ["modifyvm", :id, "--cpus", 4]
    end
end
