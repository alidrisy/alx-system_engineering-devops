# Fix nginx limit open files
exec {'Change open files limit':
    command  => 'sudo sed -i "s/15/2000/" /etc/default/nginx',
    provider => shell,
    onlyif   => 'test -f /etc/default/nginx'
}
exec {'Restart nginx':
    command  => 'service nginx start',
    provider => shell,
}