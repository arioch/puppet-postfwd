# == Class postfwd::service
#
class postfwd::service {
  service { $::postfwd::service_name:
    ensure    => $::postfwd::service_ensure,
    enable    => $::postfwd::service_enable,
    hasstatus => $::postfwd::service_hasstatus,
    require   => Class['::postfwd::config'],
  }
}

