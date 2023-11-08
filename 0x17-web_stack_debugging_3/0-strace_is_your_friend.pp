# find out why Apache is returning a 500 error.  and fix it

  exec {'Fix apache2':
      command  => 'sudo sed -i "s/.phpp/.php/" /var/www/html/wp-settings.php',
      provider => shell,
  }
