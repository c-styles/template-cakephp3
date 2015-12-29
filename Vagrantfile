# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # キーを変えないようにする(Windows対策)
  config.ssh.insert_key = false
  # SSH Agentを利用可能にする
  config.ssh.forward_agent = true
  # CentOS 7.2 from Packer
  config.vm.box = "centos_72"
  config.vm.box_url = "file://./builds/centos-7.2.virtualbox.box"
  # プライベートアドレス
  config.vm.network 'private_network', ip: '192.168.50.10'
  # 共有フォルダの設定
  config.vm.synced_folder './', '/vagrant', owner: 'vagrant', group: 'vagrant', nfs: false
  # VirtualBox独自設定
  config.vm.provider :virtualbox do |vb|
    # 共有フォルダWindows対策
    vb.customize [
                   'setextradata', :id,
                   'VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled',  0
                 ]
    # 共有フォルダWindows対策
    vb.customize [
                   'setextradata', :id,
                   'VBoxInternal2/SharedFoldersEnableSymlinksCreate', '1'
                 ]
    # メモリ増設
    vb.customize ['modifyvm', :id, '--memory', '1024']
    # 準仮想化
    vb.customize ['modifyvm', :id, '--paravirtprovider', 'kvm']
  end
  # 各プラグインの設定
  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.auto_detect = true
  end
  if Vagrant.has_plugin?('vagrant-berkshelf')
    config.berkshelf.enabled = false
  end
  if Vagrant.has_plugin?('HostManager')
    config.hostmanager.enabled = false
    config.hostmanager.manage_host = false
  end

  # プロビジョニング
  # プロビジョニングに最低限必要な物を事前にインストールする
  config.vm.provision 'shell' do |shell|
    shell.name = 'install_common'
    shell.path = './shells/install_common.sh'
  end
  config.vm.provision 'shell' do |shell|
    shell.name = 'install_chefdk'
    shell.path = './shells/install_chefdk.sh'
  end
  config.vm.provision 'shell' do |shell|
    shell.privileged = false
    shell.name = 'prepare_vagrant_workspace'
    shell.path = './shells/prepare_vagrant_workspace.sh'
    shell.args = ['/vagrant/','/tmp/vagrant']
  end
  config.vm.provision 'shell' do |shell|
    shell.privileged = false
    shell.name = 'berks_vendor'
    shell.path = './shells/berks_vendor.sh'
    shell.args = ['/tmp/vagrant']
  end
  config.vm.provision 'shell' do |shell|
    shell.name = 'chef_client_local_mode'
    shell.path = './shells/chef_client_local_mode.sh'
    shell.args = ['/tmp/vagrant','./nodes/vagrant.json']
  end
end
