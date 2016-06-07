#
# Cookbook Name:: chef_intro
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

file '/mydir/hello.txt' do
  content 'Hello there!'
  mode '0644'
end
