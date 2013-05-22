# = Define: postfwd::script
#
# == Parameters:
#
# $ensure     Default: present
#
define postfwd::rule (
  $action,
  $policy,
  $ensure = present,
  $order  = '02',
) {
  concat::fragment { "postfwd_rule_${name}":
    ensure  => $ensure,
    target  => $postfwd::config_file,
    content => template('postfwd/rule.erb'),
    order   => $order,
  }
}

