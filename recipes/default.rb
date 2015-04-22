extension_dir_cmd = Mixlib::ShellOut.new("php -i | grep extension_dir | awk '{print $(NF)}'")
extension_dir = extension_dir_cmd.run_command.stdout.to_s

# Install Xdebug
php_pear "xdebug" do
  zend_extensions ['xdebug.so']
  action :install
end

template node['xdebug']['ini'] do
  source    "xdebug.ini.erb"
  owner     "root"
  group     "root"
  mode      "0644"
  action    :create
  notifies  :restart, "service[apache2]", :delayed

  variables({
    'ext_dir' => extension_dir
  })
end