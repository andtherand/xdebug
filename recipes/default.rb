include_recipe "php"
include_recipe "apache2"

#Install Xdebug
php_pear "xdebug" do
	zend_extensions ['xdebug.so']
  action :install
end

template "#{node['php']['ext_conf_dir']}/xdebug.ini" do
  source "xdebug.ini.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
  notifies :restart, resources("service[apache2]"), :delayed
end