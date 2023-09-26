# Setup New Ubuntu server with nginx

exec {'update':
  command => '/usr/bin/apt-get update -y',
  }

pakage {'nginx':
  provider => 'apt',
  install_options =>[ '-y' ]
  require => Exec['update'],
  }


file {"/var/www/html/index.nginx-debian.html":
  content => 'Hello World!
  }

	  
service {'nginx':
  ensure => running,
  Restart => true
  }
