# Setup New Ubuntu server with nginx

exec {'update':
  command => '/usr/bin/apt-get update',
  provider => 'shell'
  }

pakage {'nginx':
  provider => 'apt',
  install_options =>[ '-y' ]
  require => Exec['update'],
  }


file {"/var/www/html/index.nginx-debian.html":
  ensure => 'file',
  owner => '$USER',
  group =>  '$USER',
  mode => '0744',
  content => 'Hello World!
  }

exec {'redirect me':
  command => 'sed -i "24i\        rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
  provider => 'shell' 
 }
	  
service {'nginx':
  ensure => running,
  Restart => true
  }
