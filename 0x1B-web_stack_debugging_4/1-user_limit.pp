#Chang open files limit for hollberton user

exec {'Change hard open files limit':
    command  => 'sed -i "s/4/200/" /etc/security/limits.conf',
    provider => shell
}

exec {'Change soft open files limit':
    command  => 'sed -i "s/5/200/" /etc/security/limits.conf',
    provider => shell
}
