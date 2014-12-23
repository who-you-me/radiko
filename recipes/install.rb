#
# Cookbook Name:: radiko
# Recipe:: default
#
# Copyright 2014, Hisao Soyama
#

include_recipe "system::timezone"
include_recipe "ntp"

packages = %w(swftools rtmpdump libxml2 wget ffmpeg lame)

case node[:platform]
  when "centos"
    include_recipe "yum-epel"
    include_recipe "yum-repoforge"
    package_options = "--enablerepo=epel,rpmforge"

  when "ubuntu"
    packages.push "libxml2-utils"
    codename = node['lsb']['codename']

    if codename == "trusty" then
      include_recipe "apt"

      apt_repository "trusty-media" do
        uri "http://ppa.launchpad.net/mc3man/trusty-media/ubuntu"
        distribution codename
        components ["main"]
        keyserver "keyserver.ubuntu.com"
        key "8E51A6D660CD88D67D65221D90BD7EACED8E640A"
      end
    end
end

radiko_user = node[:radiko][:user]
radiko_home = node[:radiko][:home_dir]

user radiko_user do
  home      "/home/#{radiko_user}"
  shell     "/bin/false"
  password  nil
  action    :create
end

[radiko_home, "#{radiko_home}/bin"].each do |dir|
  directory dir do
    owner   radiko_user
    group   radiko_user
    mode    "0755"
    action  :create
  end
end

packages.each do |pkg|
  package pkg do
    action  :install
    options package_options
  end
end

# download recording script
remote_file "#{radiko_home}/bin/rec_radiko.sh" do
  source  "https://gist.githubusercontent.com/matchy2/3956266/raw/1b38b25eb954419b019cada7ba4081e88ea1fb16/rec_radiko.sh"
  owner   radiko_user
  group   radiko_user
  mode    "0755"
  action  :create_if_missing
end

