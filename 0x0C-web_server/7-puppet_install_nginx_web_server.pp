exec {'update':
  command => 'apt-get -y update',
  provider => 'shell'
  }

pakage {'nginx':
  provider => 'apt-get',
  install_options =>[ '-y' ]
  }


file {"/var/www/html/index.nginx-debian.html":
  ensure => 'file',
  owner => '$USER',
  group =>  '$USER',
  mode => '0744',
  content => 'Hello World!
  }

exec {'redirect_me':
  command => 'sed -i "24i\        rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
  provider => 'shell' 
 }
	  
service {'nginx':
  ensure => running,
  enable => true,
  Restart => true
  }
