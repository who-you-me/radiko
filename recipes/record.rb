#
# Cookbook Name:: radiko
# Recipe:: default
#
# Copyright 2014, Hisao Soyama
#

radiko_user = node[:radiko][:user]
radiko_home = node[:radiko][:home_dir]
save_to = node[:radiko][:save_to]

directory save_to do
  owner   radiko_user
  group   radiko_user
  mode    "0755"
  action  :create
end

# cron setting
node[:radiko][:programs].each do |program|
  cron "record #{program[:name]}" do
    user    radiko_user
    command "#{radiko_home}/bin/rec_radiko.sh #{program[:channel]} #{program[:time]} #{save_to} #{program[:name]}"
    minute  program[:minute]
    hour    program[:hour]
    day     program[:day]
    month   program[:month]
    weekday program[:weekday]
  end
end

