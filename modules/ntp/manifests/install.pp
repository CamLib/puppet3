class ntp::install {

  if $ntp::packages {
    package{ $ntp::packages:
      ensure => $ntp::version
    }
  }

}
