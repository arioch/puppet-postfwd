# == Class postfwd::config
#
class postfwd::config {
  File {
    require => Class['::postfwd::install'],
    notify  => Service[$::postfwd::service_name],
    owner   => $::postfwd::config_user,
    group   => $::postfwd::config_group,
    mode    => $::postfwd::config_file_mode,
  }

  concat { $::postfwd::config_file:
    owner => $::postfwd::config_user,
    group => $::postfwd::config_group,
    mode  => $::postfwd::config_file_mode,
  }

  # Adjust /etc/default/postfwd on Debian systems
  case $::osfamily {
    'Debian': {
      augeas { 'postfwd config file' :
        context => '/files/etc/default/postfwd',
        changes => "set CONF ${postfwd::config_file}",
      }

      augeas { 'postfwd listen address' :
        context => '/files/etc/default/postfwd',
        changes => "set INET ${postfwd::listen_address}",
      }

      augeas { 'postfwd listen port' :
        context => '/files/etc/default/postfwd',
        changes => "set PORT ${postfwd::listen_port}",
      }

      augeas { 'postfwd user' :
        context => '/files/etc/default/postfwd',
        changes => "set RUNAS ${postfwd::daemon_user}",
      }

      if $::postfwd::service_enable
      and $::postfwd::service_ensure == 'running' {
        augeas { 'postfwd STARTUP' :
          context => '/files/etc/default/postfwd',
          changes => 'set STARTUP 1',
        }
      } else {
        augeas { 'postfwd RUN_DAEMON' :
          context => '/files/etc/default/postfwd',
          changes => 'set STARTUP 1',
        }
      }
    }

    default: {
    }
  }
}

