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
      local_config.vm.box = "ubuntu_12_04_64"
      local_config.vm.box_url="http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"

      local_config.vm.network :private_network, ip: "192.168.33.10"
      local_config.vm.provider :virtualbox  do |vb|

      end     
  end
  config.vm.define :zk2 do |local_config|
      local_config.vm.box = "ubuntu_12_04_64"
      local_config.vm.box_url="http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"
      local_config.vm.network :private_network, ip: "192.168.33.11"
      local_config.vm.provider :virtualbox  do |vb|

      end     
  end
  config.vm.define :zk3 do |local_config|
      local_config.vm.box = "ubuntu_12_04_64"
      local_config.vm.box_url="http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"
      local_config.vm.network :private_network, ip: "192.168.33.12"
      local_config.vm.provider :virtualbox  do |vb|

      end     
  end
  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
   config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
     chef.add_recipe "apt"
     chef.add_recipe "zookeeper"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
     chef.json = { 
        :exhibitor => {
          :opts => {
            :nodemodification => "true",
            :zkconfigconnect => "192.168.33.10:2181,192.168.33.11:2181,192.168.33.12:2181"
          }
        }
     }
   end

end
