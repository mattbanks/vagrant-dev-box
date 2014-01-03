Vagrant.configure("2") do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.network :private_network, ip: "192.168.56.101"
    config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 1024]
    v.customize ["modifyvm", :id, "--name", "kcm-dev-box"]
  end


  nfs_setting = RUBY_PLATFORM =~ /darwin/ || RUBY_PLATFORM =~ /linux/
  config.vm.synced_folder "~/Sites", "/var/www", id: "webroot", :nfs => false
  config.vm.synced_folder "~/Dropbox/Projects", "/Users/mattbanks/Dropbox/Projects", id: "projectsfolder", :nfs => false

  config.vm.provision :shell, :path => "install.sh"

end
