#
# Cookbook Name:: template-cakephp3
# Recipe:: http-web
#
# Copyright 2015, c-styles
#
# MIT Lisence
#

instance_name='web';

httpd_service "#{instance_name}" do
    version '2.4'
    action [:create, :start]
end


httpd_config 'vagrant' do
    instance "#{instance_name}"
    source 'vagrant.erb'
    action :create
    notifies :restart, "httpd_service[#{instance_name}]"
end
