#
# Cookbook Name:: template-cakephp3
# Recipe:: mysql-server
#
# Copyright 2015, c-styles
#
# MIT Lisence
#

instance_name='server';

mysql_service "#{instance_name}" do
    port '3306'
    bind_address '0.0.0.0'
    version '5.7'
    initial_root_password ''
    action [:create, :start]
end

mysql2_chef_gem "#{instance_name}" do
    action :install
end

# Create a mysql database
mysql_database 'cj_db' do
    connection(
        :host     => 'localhost',
        :socket   => "/var/run/mysql-#{instance_name}/mysqld.sock",
        :username => 'root',
        :password => ''
    )
    action :create
end

mysql_database 'test_cj_db' do
    connection(
        :host     => 'localhost',
        :socket   => "/var/run/mysql-#{instance_name}/mysqld.sock",
        :username => 'root',
        :password => ''
    )
    action :create
end
