#
# Cookbook Name:: template-cakephp3
# Recipe:: mysql-client
#
# Copyright 2015, c-styles
#
# MIT Lisence
#

instance_name='client';

mysql_client "#{instance_name}" do
    version '5.7'
    action [:create]
end

