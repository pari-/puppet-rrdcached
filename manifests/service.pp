class rrdcached::service {
  service {$rrdcached::service_name:
    ensure     => $rrdcached::service_ensure,
    enable     => $rrdcached::service_enable,
    hasstatus  => true,
    hasrestart => true,
  }
}
