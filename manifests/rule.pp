# == Define: postfwd::script
#
# === Parameters:
#
# $action::   PostFWD action rule.
#
# $policy::   PostFWD policy rule.
#
# $ensure::   Default: present
#
# $order::    Default: '02'
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

