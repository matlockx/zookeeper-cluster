# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu_12_04_64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.define :zk1 do |local_config|
      local_config.vm.box = "centos64_x86_64_pp"
      config.vm.hostname = "zookeeper1"
      #local_config.vm.box = "centos64_x86_64_pp"
      #local_config.vm.box_url="http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"

      local_config.vm.network :private_network, ip: "192.168.33.11"
      local_config.vm.provider :virtualbox  do |vb|

      end     
      config.vm.provision :puppet do |puppet|
        puppet.options = "--verbose --debug"
        puppet.manifests_path = "manifests"
        puppet.module_path = "modules"
      end
  end
 config.vm.define :zk2 do |local_config|
      local_config.vm.box = "centos64_x86_64_pp"
      config.vm.hostname = "zookeeper2"
      #local_config.vm.box = "centos64_x86_64_pp"
      #local_config.vm.box_url="http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"

      local_config.vm.network :private_network, ip: "192.168.33.12"
      local_config.vm.provider :virtualbox  do |vb|

      end     
      config.vm.provision :puppet do |puppet|
        puppet.options = "--verbose --debug"
        puppet.manifests_path = "manifests"
        puppet.module_path = "modules"
      end
  end
  config.vm.define :zk3 do |local_config|
      local_config.vm.box = "centos64_x86_64_pp"
      config.vm.hostname = "zookeeper3"
      #local_config.vm.box = "centos64_x86_64_pp"
      #local_config.vm.box_url="http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"

      local_config.vm.network :private_network, ip: "192.168.33.13"
      local_config.vm.provider :virtualbox  do |vb|

      end     
      config.vm.provision :puppet do |puppet|
        puppet.options = "--verbose --debug"
        puppet.manifests_path = "manifests"
        puppet.module_path = "modules"
      end
  end
end
