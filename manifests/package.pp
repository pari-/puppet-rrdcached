class rrdcached::package {
  if $rrdcached::ensure == 'present' {
    $package_ensure = $rrdcached::auto_upgrade ? {
      true  => 'latest',
      false => 'installed',
    }
  } else {
    $package_ensure = 'purged'
  }

  package {$rrdcached::package:
    ensure          => $package_ensure,
  }
}
