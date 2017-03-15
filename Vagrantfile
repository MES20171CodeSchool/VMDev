Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu-server-14.04"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.define :django do |web_config|
    web_config.vm.network "private_network", ip: "192.168.50.10"
    config.vm.network :forwarded_port, guest: 80, host: 8080
    web_config.vm.provision "puppet" do |puppet|
      puppet.manifest_file = "django.pp"
    end
  end
end
