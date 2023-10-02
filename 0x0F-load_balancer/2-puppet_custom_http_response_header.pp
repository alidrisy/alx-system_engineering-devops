# creating a custom HTTP header response

 exec { 'update system':
         command => 'apt-get -y update',
         provider => 'shell'
 }
 
 package { 'nginx': 
         ensure => 'installed', 
         require => Exec['update system'] 
 } 
  
 file {'/var/www/html/index.html': 
         content => 'Hello World!' 
 } 
  
 exec {'redirect_me': 
         command => 'sed -i "24i\\trewrite ^/redirect_me https://th3-gr00t.tk/ permanent;" /etc/nginx/sites-available/default', 
         provider => 'shell' 
 } 
  
 exec {'HTTP header': 
         command => 'sed -i "25i\\tadd_header X-Served-By \$hostname;" /etc/nginx/sites-available/default', 
         provider => 'shell' 
 } 
  
 service {'nginx': 
         ensure => running, 
         require => Package['nginx'] 
 }
