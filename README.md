[puppet-exim](https://github.com/stankevich/puppet-exim)
======

Puppet module for installing and managing Exim.

## Usage

### exim

Installs and manages Exim.

**mail_relay** — Mail relay server.

**root_email** — Address to forward root email to. Default: root@$DOMAIN

	class { 'exim':
	  mail_relay    => 'mail.example.com',
	  root_email    => 'root@example.com',
    dc_relay_nets => 'localhost : 10.223.68.230';
	}

## Authors

[Sergey Stankevich](https://github.com/stankevich)
[Lars Falk-Petersen](https://github.com/copyleft/)
