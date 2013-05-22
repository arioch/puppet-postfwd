# = Class postfwd::config
#
class postfwd::config {
  File {
    require => Class['::postfwd::install'],
    notify  => Service[$::postfwd::service_name],
    owner   => $::postfwd::config_user,
    group   => $::postfwd::config_group,
    mode    => $::postfwd::config_file_mode,
  }

  #file { $::postfwd::config_file:
  #  ensure => present,
  #}

  concat { $::postfwd::config_file:
    owner => $::postfwd::config_user,
    group => $::postfwd::config_group,
    mode  => $::postfwd::config_file_mode,
  }
}

