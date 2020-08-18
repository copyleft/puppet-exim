class exim::config {

  if $update_aliases {
    exec { 'exim_aliases':
      command     => 'systemctl reload exim4',
      refreshonly => true,
    }

    file {
      '/etc/aliases':
        content => template('exim/aliases.erb'),
        notify  => Exec['exim_aliases'],
        require => File['/etc/exim4/update-exim4.conf.conf'];
    }
  }

  exec { 'exim_update':
    command     => '/usr/sbin/update-exim4.conf',
    refreshonly => true,
  }

  File {
    ensure => present,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    notify => Exec['exim_update'],
  }

  file {
    '/etc/mailname':
      content => template('exim/mailname.erb');
    '/etc/exim4/update-exim4.conf.conf':
      content => template('exim/update-exim4.conf.conf.erb');
  }

}
