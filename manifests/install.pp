# == Class: postfwd::install
#
class postfwd::install {
  package { $::postfwd::pkg_list:
    ensure => $::postfwd::pkg_ensure,
  }

  if $::postfwd::pkg_deps {
    package { $::postfwd::pkg_deps:
      ensure => $::postfwd::pkg_ensure,
      before => Package[$::postfwd::pkg_list],
    }
  }
}

