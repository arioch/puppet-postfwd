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
  $target = $postfwd::config_file,
) {
  concat::fragment { "postfwd_rule_${name}":
    ensure  => $ensure,
    target  => $target,
    content => template('postfwd/rule.erb'),
    order   => $order,
  }
}

