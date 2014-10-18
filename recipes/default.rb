include_recipe "php"
include_recipe "apache2"

case node["platform_family"]
when "debian"

    package 'php5-xdebug' do
        action :install
    end

when "rhel"
  # do things on RHEL platforms (redhat, centos, scientific, etc)
end


template "#{node['php']['ext_conf_dir']}/#{node['xdebug']['ini_name']}" do
  source "xdebug.ini.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
  notifies :restart, resources("service[apache2]"), :delayed
end