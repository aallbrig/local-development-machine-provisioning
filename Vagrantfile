VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.insert_key = false

  config.vm.define "ubuntu-machine" do |ubuntu|
    ubuntu.vm.box = "box-cutter/ubuntu1404-desktop"
    ubuntu.vm.synced_folder ".", "/vagrant", disabled: true
    # ubuntu.vm.network "private_network", ip: "192.168.50.4"
    # ubuntu.vm.network "private_network", ip: "192.168.50.20"
    ubuntu.vm.synced_folder ".", "/vagrant", disabled: true
    ubuntu.vm.provider "virtualbox" do |vb|
      vb.gui = true
      # vb.memory = 4096
      vb.memory = 2048
      vb.cpus = 2
      vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
      vb.customize ["modifyvm", :id, "--usb", "on"]
      vb.customize ["modifyvm", :id, "--usbehci", "on"]
      # vb.customize [
      #   'usbfilter', 'add', '0',
      #   '--target', :id,
      #   '--name', 'ESP',
      #   '--vendorid', '0x1a86',
      #   '--productid', '0x7523'
      # ]
    end
  end

  config.vm.define "osx-machine" do |osx|
    osx.vm.box = "http://files.dryga.com/boxes/osx-sierra-0.3.1.box"
  end

end