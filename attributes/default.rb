default[:xdebug][:ini] =
  case node['platform']
    when 'ubuntu'
      if node['platform_version'].to_f >= 14.04
        '/etc/php/apache2/conf.d/20-xdebug.ini'
      else
        "#{node[:php][:ext_conf_dir]}/xdebug.ini"
    end
  end