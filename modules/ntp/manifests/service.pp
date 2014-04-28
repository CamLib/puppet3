class ntp::service {
  $ensure = $ntp::start ? {true => running, default => stopped}
 
  service{ $ntp::servicename:
    ensure  => $ensure,
    enable  => $ntp::enable,
  }

}
