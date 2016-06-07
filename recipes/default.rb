#
# Cookbook Name:: chef_intro
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

user node['chef_intro']['username'] do
  uid '1234'
  home '/home/random'
  shell '/bin/bash'
end

directory '/mydir' do
  action :create
end

file '/mydir/hello.txt' do
  content 'Hello there!'
  owner node['chef_intro']['username']
  mode '0644'
end

template '/mydir/info.txt' do
  source 'somefile.txt.erb'
  variables ({ message: 'some_more_data', clientdata: data_bag_item('users', 'poweruser') })
end
