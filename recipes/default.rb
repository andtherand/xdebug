#Install Xdebug
php_pear "xdebug" do
  zend_extensions ['xdebug.so']
  action :install
end

template "#{node[:xdebug][:ini]}" do
  source "xdebug.ini.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
  notifies :restart, resources("service[apache2]"), :delayed
end