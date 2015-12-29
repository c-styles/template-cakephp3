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

