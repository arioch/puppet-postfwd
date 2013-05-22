# = Class postfwd
#
class postfwd (
  $config_file        = $postfwd::params::config_file,
  $config_file_mode   = $postfwd::params::config_file_mode,
  $config_group       = $postfwd::params::config_group,
  $config_user        = $postfwd::params::config_user,
  $daemon_group       = $postfwd::params::daemon_group,
  $daemon_user        = $postfwd::params::daemon_user,
  $pkg_deps           = $postfwd::params::pkg_deps,
  $pkg_ensure         = $postfwd::params::pkg_ensure,
  $pkg_list           = $postfwd::params::pkg_list,
  $service_enable     = $postfwd::params::service_enable,
  $service_ensure     = $postfwd::params::service_ensure,
  $service_hasrestart = $postfwd::params::service_hasrestart,
  $service_hasstatus  = $postfwd::params::service_hasstatus,
  $service_name       = $postfwd::params::service_name,
) inherits postfwd::params {
  class { 'postfwd::install': } ->
  class { 'postfwd::config': } ~>
  class { 'postfwd::service': } ->
  Class['postfwd']
}

