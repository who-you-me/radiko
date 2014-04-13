#
# Cookbook Name:: rec_radiko
# Recipe:: default
#
# Copyright 2014, Hisao Soyama
#

include_recipe "yum-epel"
include_recipe "yum-repoforge"

# time setting
package "ntp" do
    action  :install
end

service "ntpd" do
    supports    :restart => true, :reload => true, :status => true
    action      :nothing
end

cookbook_file "/etc/ntp.conf" do
    owner       "root"
    group       "root"
    mode        "0644"
    action      :create
    notifies    :restart, "service[ntpd]"
end

# create radiko user and needed directory
radiko_home = "/home/radiko"

user "radiko" do
    action      :create
    home        radiko_home
    shell       "/bin/false"
    password    nil
end

%w(bin rec).each do |dir|
    directory "#{radiko_home}/#{dir}" do
        owner   "radiko"
        group   "radiko"
        mode    "0755"
        action  :create
    end
end

# install dependent applications
%w(swftools rtmpdump libxml2 wget ffmpeg lame).each do |pkg|
    package pkg do
        action  :install
        options "--enablerepo=epel,rpmforge"
    end
end

# download recording script
remote_file "#{radiko_home}/bin/rec_radiko.sh" do
    source  "https://gist.githubusercontent.com/matchy2/3956266/raw/1b38b25eb954419b019cada7ba4081e88ea1fb16/rec_radiko.sh"
    owner   "radiko"
    group   "radiko"
    mode    "0755"
    action  :create_if_missing
end

# cron setting
node[:radiko][:programs].each do |program|
    cron "record #{program[:name]}" do
        user    "radiko"
        command "#{radiko_home}/bin/rec_radiko.sh #{program[:channel]} #{program[:time]} #{node[:radiko][:save_to]} #{program[:name]}"
        minute  program[:minute]
        hour    program[:hour]
        day     program[:day]
        month   program[:month]
        weekday program[:weekday]
    end
end
