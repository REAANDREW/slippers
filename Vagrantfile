# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "alpine/alpine64"
  config.ssh.forward_agent = true

  config.vm.provision :shell, inline: "sudo apk --update add curl tar zip unzip shadow python sudo bash py-pip && curl -Ls https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk > /tmp/glibc-2.25-r0.apk && apk add --allow-untrusted /tmp/glibc-2.25-r0.apk"

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
