# == Class: postfwd
#
# === Parameters:
#
# $config_file::          Location of the main configuration file.
#                         Default: operating system specific.
#
# $config_file_mode::     Posix file mode for configuration files.
#                         Default: 0644.
#
# $config_group::         Posix group for configuration files.
#                         Default: operating system specific.
#
# $config_user::          Posix user for configuration files.
#                         Default: operating system specific.
#
# $daemon_group::         Unprivileged group to run daemon.
#                         Default: operating system specific.
#
# $daemon_user::          Unprivileged user to run daemon.
#                         Default: operating system specific.
#
# $listen_address::       Which address to bind the daemon to.
#                         Default: 127.0.0.1.
#
# $listen_port::          Which port to bind the daemon to.
#                         Default: 10040.
#
# $pkg_deps::             Any dependencies that need to be resolved before
#                         installing the main package.
#                         Default: operating system specific.
#
# $pkg_ensure::           Ensure state for packages.
#                         Default: present.
#
# $pkg_list::             An array containing the main package and possibly
#                         a number of dependencies.
#                         Default: operating system specific.
#
# $service_enable::       Enable/disable the daemon at boot time.
#                         Default: true.
#
# $service_ensure::       Ensure daemon state.
#                         Default: running.
#
# $service_hasrestart::   Specify whether or not the init script has restart.
#                         Default: operating system specific.
#
# $service_hasstatus::    Specify whether or not the init script has status.
#                         Default: operating system specific.
#
# $service_name::         Specify the name of the init script.
#                         Default: operating system specific.
#
class postfwd (
  $config_file        = $postfwd::params::config_file,
  $config_file_mode   = $postfwd::params::config_file_mode,
  $config_group       = $postfwd::params::config_group,
  $config_user        = $postfwd::params::config_user,
  $daemon_group       = $postfwd::params::daemon_group,
  $daemon_user        = $postfwd::params::daemon_user,
  $listen_address     = $postfwd::params::listen_address,
  $listen_port        = $postfwd::params::listen_port,
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

