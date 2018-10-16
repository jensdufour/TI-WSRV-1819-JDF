
# The contents below were provided by the Packer Vagrant post-processor

Vagrant.configure("2") do |config|
  config.vm.base_mac = "08002781D238"
end


# The contents below (if any) are custom contents provided by the
# Packer template during image build.
# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "jborean93/WindowsServer2016"
  config.vm.guest = :windows
  config.vm.communicator = "winrm"
  config.winrm.username = "Administrator"
  config.winrm.password = "Project2016"
  config.vm.boot_timeout = 600
  config.vm.network :forwarded_port, guest: 3389, host: 3389, id: 'rdp', auto_correct: true
  config.vm.network :forwarded_port, guest: 22, host: 2222, id: 'ssh', auto_correct: true

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = 2048
    vb.cpus = 2
    vb.name = "WindowsServer2016"
  end

  config.vm.provider "hyperv" do |h|
    h.memory = 2048
    h.cpus = 2
  end
end

