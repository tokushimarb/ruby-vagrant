VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ruby-vagrant"
  config.vm.box_url = "https://github.com/tokushimarb/ruby-vagrant/releases/download/20150711/ruby-vagrant-virtualbox-x86_64.box"
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.provider :virtualbox do |vb|
    # see: http://blog.shibayu36.org/entry/2013/08/12/090545
    # IPv6 と DNS でのネットワーク遅延対策で追記
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
  end
end
