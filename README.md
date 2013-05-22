# Puppet PostFWD

## Requirements

* [concat module](https://github.com/ripienaar/puppet-concat)

## Example usage

### Install PostFWD

    node /box/ {
      include postfwd
    }


### Configure PostFWD

    node /box/ {
      class { 'postfwd':
        daemon_user  => 'postfw',
        daemon_group => 'postfw',
      }
    }


### Add rules

    postfwd::rule { 'Rate limit':
      policy => 'sender_domain=example.org',
      action => 'action=rate(client_address/50/3600/450 4.7.1 sorry, max 50 requests per hour)',
      order  => '02',
    }

