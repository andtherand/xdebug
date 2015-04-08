name		  	  "xdebug"
maintainer        "mychiara"
maintainer_email  "mychiara+cookbooks@gmail.com"
license           "Apache 2.0"
description       "installs the xdebug extension for php on an apache2 webserver"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.9"
recipe            "xdebug", "installs the xdebug extension for php on an apache2 webserver"

%w{ debian ubuntu }.each do |os|
  supports os
end

%w{ apache2 php }.each do | cookbook |
	depends cookbook
end

