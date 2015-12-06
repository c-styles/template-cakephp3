# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # キーを変えないようにする(Windows対策)
  config.ssh.insert_key = false
  # SSH Agentを利用可能にする
  config.ssh.forward_agent = true
  # CentOS 7.1汎用
  config.vm.box = 'bento/centos-6.7'
  # プライベートアドレス
  config.vm.network 'private_network', ip: '192.168.50.10'
  # 共有フォルダの設定
  config.vm.synced_folder './', '/vagrant', owner: 'vagrant', group: 'vagrant', mount_options: ['dmode=777', 'fmode=666']
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
end
