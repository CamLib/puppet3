class ntp::install {

  if $ntp::package {
    package{ $ntp::package:
      ensure => $ntp::version
    }
  }

}
