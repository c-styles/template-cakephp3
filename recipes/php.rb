#
# Cookbook Name:: template-cakephp3
# Recipe:: php
#
# Copyright 2015, c-styles
#
# MIT Lisence
#

# remi-php70を有効にする
package 'remi-release' do
    action :install
    options '--enablerepo=remi'
end

rpm_package 'remi-release-7.rpm' do
    source 'http://rpms.famillecollet.com/enterprise/remi-release-7.rpm'
end

package 'epel-release' do
    action :install
    options '--enablerepo=epel'
end


%w{
    libtidy
    libmhash
    httpd-devel
    gcc
    gcc-c++
    libxml2-devel
    openssl-devel
    bzip2-devel
    libxslt-devel
    libicu
    libicu-devel
    readline-devel
    libmcrypt
    libmcrypt-devel
}.each do |pkg|
    package pkg do
        action :install
        options '--enablerepo=remi,epel'
    end
end

include_recipe 'php::default'

php_pear 'zip' do
    action :install
end

# cookbookがうまく対応していないので自前で行う
package 'php-fpm' do
    action :install
    options '--enablerepo=remi-php70,remi'
end
service 'php-fpm' do
    action [:enable, :start]
end
