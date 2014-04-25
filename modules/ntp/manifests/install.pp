class ntp::install {

  package{ $ntp::package:
    ensure => $ntp::version
  }

}
