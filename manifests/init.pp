class rrdcached (
  $ensure           = $rrdcached::params::ensure,
  $package          = $rrdcached::params::package,
  $auto_upgrade     = $rrdcached::params::auto_upgrade,
  $config           = $rrdcached::params::config,
  $service_name     = $rrdcached::params::service_name,
  $service_ensure   = $rrdcached::params::service_ensure,
  $service_enable   = $rrdcached::params::service_enable,
  $listen           = $rrdcached::params::listen,
  $gid              = $rrdcached::params::gid,
  $journal_dir      = $rrdcached::params::journal_dir,
  $mode             = $rrdcached::params::mode,
  $timeout          = $rrdcached::params::timeout,
  $delay            = $rrdcached::params::delay,
  $write_threads    = $rrdcached::params::write_threads,
  $jump_dir         = $rrdcached::params::jump_dir,
  $always_flush     = $rrdcached::params::always_flush,
  $enable_corefiles = $rrdcached::params::enable_corefiles,
  $maxwait          = $rrdcached::params::maxwait,
  $restrict_writes  = $rrdcached::params::restrict_writes) inherits
rrdcached::params {
  class { 'rrdcached::package': }

  class { 'rrdcached::config': }

  class { 'rrdcached::service': }

  if $ensure == 'present' {
    Class['rrdcached::package'] -> Class['rrdcached::config'] ~> Class['rrdcached::service'
      ]
  } else {
    Class['rrdcached::service'] -> Class['rrdcached::package']
  }
}
