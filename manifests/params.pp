# = Class postfwd::params
#
class postfwd::params {
  case $::osfamily {
    'RedHat': {
      $config_file        = '/etc/postfix/postfwd.cf'
      $config_file_mode   = '0644'
      $config_group       = 'root'
      $config_user        = 'root'
      $daemon_group       = 'postfw'
      $daemon_user        = 'postfw'
      $pkg_deps           = undef
      $pkg_ensure         = present
      $pkg_list           = undef
      $service_enable     = true
      $service_ensure     = running
      $service_hasrestart = true
      $service_hasstatus  = false
      $service_name       = 'postfwd'
    }

    'Debian': {
      $config_file        = '/etc/postfix/postfwd.cf'
      $config_file_mode   = '0644'
      $config_group       = 'root'
      $config_user        = 'root'
      $daemon_group       = 'postfw'
      $daemon_user        = 'postfw'
      $pkg_deps           = undef
      $pkg_ensure         = present
      $pkg_list           = 'postfwd'
      $service_enable     = true
      $service_ensure     = running
      $service_hasrestart = true
      $service_hasstatus  = false
      $service_name       = 'postfwd'
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported."
    }
  }
}

