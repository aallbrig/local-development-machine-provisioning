VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.insert_key = false

  config.vm.box = "box-cutter/ubuntu1404-desktop"
  # config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.hostname = "developer-machine"
  config.vm.network "private_network", ip: "192.168.50.20"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = 4096
    vb.cpus = 2
    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
    vb.customize ["modifyvm", :id, "--usb", "on"]
    vb.customize ["modifyvm", :id, "--usbehci", "on"]
    vb.customize [
      'usbfilter', 'add', '0',
      '--target', :id,
      '--name', 'ESP',
      '--vendorid', '0x1a86',
      '--productid', '0x7523'
    ]
  end

end