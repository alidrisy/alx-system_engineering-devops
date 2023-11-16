# Fix nginx limit open files

exec {'change file open limit':
    command  => 'sed -i "s/15/2000/g" /etc/default/nginx',
    provider => shell,
    onlyif   => 'test -f /etc/default/nginx'
}
