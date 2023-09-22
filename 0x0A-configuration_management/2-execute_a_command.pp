# kills a process named killmenow.
exec {'pkill killme':
  command  => 'pkill -f "killmenow"',
  provider => 'shell',
  }
