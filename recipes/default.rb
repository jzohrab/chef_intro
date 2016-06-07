#
# Cookbook Name:: chef_intro
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

directory '/mydir' do
  action :create
end

file '/mydir/hello.txt' do
  content 'Hello there!'
  mode '0644'
end
