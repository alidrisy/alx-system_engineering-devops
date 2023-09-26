# Setup New Ubuntu server with nginx 
  
 exec { 'update env': 
         command => 'apt-get -y update',
	 provider => 'shell'
 } 
  
 package { 'nginx': 
         ensure => 'installed', 
         require => Exec['update env'] 
 } 
  
 file {'/var/www/html/index.html': 
         content => 'Hello World!' 
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
