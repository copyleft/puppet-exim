class exim::install {

  if ! Package['exim'] {
    package { 'exim4': ensure => present }
  }
}
