default[:xdebug][:conf_dir] =
  case node['platform_family']
    when 'debian'
      case node['platform']
        when 'ubuntu'
          if node['platform_version'].to_f >= 14.04
            '/etc/php/apache2/conf.d'
          end
      end
    else
      node[:php][:ext_conf_dir]
  end