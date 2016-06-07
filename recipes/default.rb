#
# Cookbook Name:: chef_intro
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

user 'jsmith' do
  comment 'Agent (James) Smith'
  uid '1234'
  home '/home/random'
  shell '/bin/bash'
end

directory '/mydir' do
  action :create
end

file '/mydir/hello.txt' do
  content 'Hello there!'
  owner 'jsmith'
  mode '0644'
end
