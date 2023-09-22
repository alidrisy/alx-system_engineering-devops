# Creates a file in /tmp

file { '/tmp/school':
  path => '/tmp/school',
  ensure => file,
  owner => 'www-data',
  group => 'www-data',
  mode  => '0744',
  content => "I love Puppet",
}
