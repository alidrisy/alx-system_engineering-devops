# Setup New Ubuntu server with nginx 
 # and add a custom HTTP header 
  
 exec { 'update system': 
         command => '/usr/bin/apt-get update', 
 } 

package { 'nginx':
         ensure => 'installed',
         require => Exec['update system']
 }
  
 exec {'HTTP header': 
         command => 'sed -i "25i\\tadd_header X-Served-By \$hostname;" /etc/nginx/sites-available/default', 
         provider => 'shell' 
 } 
  
 service {'nginx': 
         ensure => running, 
         require => Package['nginx'] 
 }
