VAGRANTFILE_API_VERSION = "2"
VAGRANT_ROOT = File.dirname(File.expand_path(__FILE__))
CEPH_OSD_NUM = 3

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :ceph do |ceph|
    ceph.vm.box = "hashicorp/precise64"
    ceph.vm.host_name = "ceph"
    ceph.vm.network "private_network", ip: "192.168.251.100"
    [6789, 6800, 6801, 6802, 6803].each do |port|
      #ceph.vm.network "forwarded_port", guest: port, host: port
    end
    ceph.vm.provision :shell, :path => "setup/ceph_pre.sh"
    ceph.vm.provision :shell, :path => "setup/ceph.sh", :args => ["#{CEPH_OSD_NUM}"]

    ceph.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.customize ['storagectl', :id, '--name', 'SATA Controller', '--portcount', CEPH_OSD_NUM + 1, '--controller', 'IntelAHCI']
      (1..CEPH_OSD_NUM).each do |n| 
        disk = File.join(VAGRANT_ROOT, "vdisk#{n}.vdi")
        v.customize ['createhd', '--filename', disk, '--size', 20 * 1024]
        v.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', n, '--device', 0, '--type', 'hdd', '--medium', disk]
      end
    end
  end

  config.vm.define :client do |client|
    client.vm.box = "hashicorp/precise64"
    client.vm.host_name = "ceph-client"
    client.vm.network "private_network", ip: "192.168.251.101"
    client.vm.provision :shell, :path => "setup/ceph_pre.sh"
    client.vm.provision :shell, :path => "setup/ceph_client.sh"
  end

end
