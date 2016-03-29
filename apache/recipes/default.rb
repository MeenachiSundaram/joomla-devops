#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'httpd' do
  action :install
end

service "httpd" do
supports :restart => :true
action [:enable, :start]
end

cookbook_file '/etc/httpd/conf.d/vhost.conf' do
  source 'vhost.conf'
  owner 'apache'
  group 'apache'
  action :create
  notifies :restart, 'service[httpd]', :immediately
end
