# Fix nginx limit open files

exec {
    command => "sed -i 's/15/2000/g' /etc/default/nginx",
    provider => 'shell'
}
