# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "10.0.1.11"
  config.vm.network "forwarded_port", guest: 8888, host: 8888

  config.vm.provider "virtualbox" do |vb|
    vb.name = "archiva"
    vb.memory = "1024"
    vb.cpus = 2
  end

  config.vm.provision "shell" do |s|
    ssh_prv_key = ""
    ssh_pub_key = ""
    if File.file?("#{Dir.home}/.ssh/id_rsa")
      ssh_prv_key = File.read("#{Dir.home}/.ssh/id_rsa")
      ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
    else
      puts "No SSH key found. You will need to remedy this before pushing to the repository."
    end
    s.inline = <<-SHELL
      if grep -sq "#{ssh_pub_key}" /home/vagrant/.ssh/authorized_keys; then
        echo "SSH keys already provisioned."
        exit 0;
      fi
      echo "SSH key provisioning."
      mkdir -p /home/vagrant/.ssh/
      touch /home/vagrant/.ssh/authorized_keys
      echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
      echo #{ssh_pub_key} > /home/vagrant/.ssh/id_rsa.pub
      chmod 644 /home/vagrant/.ssh/id_rsa.pub
      echo "#{ssh_prv_key}" > /home/vagrant/.ssh/id_rsa
      chmod 600 /home/vagrant/.ssh/id_rsa
      chown -R vagrant:vagrant /home/vagrant
      exit 0
    SHELL
  end

end
