class rrdcached::config{
  file {$rrdcached::config:
    ensure  => 'present',
    content => template('rrdcached/rrdcached.conf.erb'),
  }
}

