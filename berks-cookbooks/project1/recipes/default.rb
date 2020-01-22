#
# Cookbook:: project1
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.


execute "update" do
  command "sudo apt-get update"
end

package "python3-dev"

package "python3-pip"

execute "update" do
  command "sudo apt-get update"
end

directory 'app' do
  mode '0777'
  path 'home/ubuntu/app'
  action :create
end

template 'requirements.txt' do
  source 'requirements.txt.erb'
  path '/home/ubuntu/app/requirements.txt'
  action :create
end

execute "pip install requirements" do
  command "sudo -H pip3 install -r home/ubuntu/app/requirements.txt"
  action :run
end


directory 'downloads' do
  mode '0777'
  path 'home/ubuntu/downloads'
  action :create
end

 file '/home/ubuntu/downloads/ItJobsWatchTop30.csv' do
  action :create
  mode '777'
end
