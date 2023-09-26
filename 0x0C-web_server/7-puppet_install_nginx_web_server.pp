# Setup New Ubuntu server with nginx

exec {'update env':
  command => '/usr/bin/apt-get update',
  }
pakage {'nginx':
  ensure => 'installed',
  require => Exec['update env']
  }


file {"/var/www/html/index.nginx-debian.html":
  content => 'Hello World!
  }

exec {'redirect me':
  command => 'sed -i "24i\        rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
  provider => 'shell'
}
	  
service {'nginx':
  ensure => running,
  Restart => true,
  require => Package['nginx']
  }
