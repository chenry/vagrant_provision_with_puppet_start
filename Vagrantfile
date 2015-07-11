# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise32"

  config.vm.network "forwarded_port", guest:80, host:3000

  config.vm.provision :shell do |shell|
    shell.inline = "mkdir -p /etc/puppet/modules;
	 	    (puppet module list | grep puppetlabs-nodejs) || (puppet module install puppetlabs/nodejs);
		    (puppet module list | grep puppetlabs-apache) || (puppet module install puppetlabs/apache);
		    (puppet module list | grep puppetlabs-java) || (puppet module install puppetlabs/java)"
  end

  config.vm.provision :puppet
end
