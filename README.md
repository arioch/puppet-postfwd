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
      class { 'postfwd':;
      }
    }

